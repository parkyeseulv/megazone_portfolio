terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "compute/state"
  }
}
