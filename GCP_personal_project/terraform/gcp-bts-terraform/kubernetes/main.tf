data "google_compute_network" "vpc_network" {
  project=var.project_id
  name = var.network_name
}
data "google_compute_subnetwork" "subnets" {
  name   = var.priv_sub_1
  region = var.region
}

# GKE cluster
resource "google_container_cluster" "cluster" {
  name     = "${var.project_id}-gke"
  network  = data.google_compute_network.vpc_network.name
  subnetwork   = data.google_compute_subnetwork.subnets.name
  cluster_ipv4_cidr = var.master_ipv4_cidr_block
  remove_default_node_pool = true
  initial_node_count       = 1

  cluster_autoscaling {
    enabled = var.cluster_autoscaling_enabled
    dynamic "auto_provisioning_defaults" {
      for_each = var.cluster_autoscaling_enabled ? [1] : []

      content {
        service_account = local.service_account
        oauth_scopes    = local.node_pools_oauth_scopes["all"]
      }
    }
  }
  
    dynamic "private_cluster_config" {
        for_each = var.enable_private_nodes ? [{
        enable_private_nodes    = var.enable_private_nodes,
        enable_private_endpoint = var.enable_private_endpoint
        master_ipv4_cidr_block  = var.master_ipv4_cidr_block
        }] : []

        content {
            enable_private_endpoint = private_cluster_config.value.enable_private_endpoint
            enable_private_nodes    = private_cluster_config.value.enable_private_nodes
            master_ipv4_cidr_block  = private_cluster_config.value.master_ipv4_cidr_block
            dynamic "master_global_access_config" {
                for_each = var.master_global_access_enabled ? [var.master_global_access_enabled] : []
                content {
                enabled = master_global_access_config.value
                }
            }
        }
    }

    master_authorized_networks_config {
                cidr_blocks {
                    cidr_block = "10.0.0.2/32" #admin server's ip
                }
            }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "nodes" {
  name       = "${google_container_cluster.cluster.name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    machine_type = "f1-micro"
    disk_size_gb = 10
    disk_type    = "pd-standard"
    preemptible       = false
    service_account   = "build-ser-acc@hybrid-bts.iam.gserviceaccount.com" #change to variables. 
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

# create global external ip for ingress 
resource "google_compute_global_address" "raddit_static_ip" {
  name = var.global_ip_name
}