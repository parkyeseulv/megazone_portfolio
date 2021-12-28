#import sa keys
data "google_service_account" "kuber" {
  account_id = var.kuber_sa_name
}

data "google_service_account_key" "kuberkey" {
  name            = var.key_name
  public_key_type = "TYPE_X509_PEM_FILE"
}

#create secrets
#resource "kubernetes_secret" "google-application-credentials" {
#  metadata {
#    name = "credentials-key"
#  }
#  data = {
#    credentials.json = base64decode(google_service_account_key.kuberkey.name)
#  }
#}