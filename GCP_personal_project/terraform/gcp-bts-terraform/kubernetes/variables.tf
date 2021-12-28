variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "master_ipv4_cidr_block" {
  default     = "10.2.0.0/28"
  description = ""
}

variable "kuber_sa_name" {
  default     = "kuber-admin"
  description = ""
}
variable "key_name" {
  type = string
  default = "projects/hybrid-bts/serviceAccounts/vm-ser-acc@hybrid-bts.iam.gserviceaccount.com/keys/97203600b2164d524aea9f69996a6d6ad8edb624"
  description = ""
}
variable "global_ip_name" {
  default     = "bts-global-ingress"
  description = ""
}

variable "cluster_autoscaling_enabled" {
  type = bool
  default = true
  description = ""
}

variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = true
}

variable "enable_private_endpoint" {
  type        = bool
  description = "(Beta) Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}

variable "master_global_access_enabled" {
  type        = bool
  description = "(Beta) Whether the cluster master is accessible globally (from any region) or only within the same region as the private endpoint."

  default = true
}



variable "project_id" {
  type        = string
  default     = "hybrid-bts"
}

variable "network_name" {
  type        = string
  description = ""
  default = "bts-vpc"
}
variable "region" {
  type        = string
  description = ""
  default = "asia-northeast3"
}

variable "zone" {
  type        = string
  description = ""
  default = "asia-northeast3-a"
}

variable "priv_sub_2" {
  type        = string
  description = ""
  default = "bts-priv-sub-2"
}

variable "priv_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-1"
}

variable "cidr" {
  type        = string
  description = ""
  default = "10.0.0.0/16"
}

variable "priv_1_cidr" {
  type        = string
  description = ""
  default = "10.0.2.0/24"
}

variable "priv_2_cidr" {
  type        = string
  description = ""
  default = "10.0.3.0/24"
}

variable "state_bucket_name" {
  type        = string
  description = ""
  default = "bts-terraform"
}


