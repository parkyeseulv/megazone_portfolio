#service account for kuber cluster
data "google_iam_policy" "admin" {
  binding {
    role = "roles/container.clusterAdmin"

    members = [
      "serviceAccount:${google_service_account.kuber.account_id}@${var.project_id}.iam.gserviceaccount.com"
    ]
  }

  binding {
    role = "roles/storage.objectViewer"

    members = [
      "serviceAccount:${google_service_account.kuber.account_id}@${var.project_id}.iam.gserviceaccount.com"
    ]
  }
}

resource "google_service_account" "kuber" {
  account_id   = "kuber-cluster"
  display_name = "kuber-cluster"
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.kuber.account_id
  policy_data        = data.google_iam_policy.admin.policy_data
}

#keys
resource "google_service_account_key" "kuberkey" {
  service_account_id = google_service_account.kuber.account_id
  public_key_type    = "TYPE_X509_PEM_FILE"
}
