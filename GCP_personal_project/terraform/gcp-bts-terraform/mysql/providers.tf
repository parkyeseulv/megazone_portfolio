provider "google-beta" {

  credentials = file("/home/dntwkzz79/gcp-bts-terraform/credentials.json")
  project = var.project_id
  region  = var.region

}
    