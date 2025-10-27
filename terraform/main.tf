terraform {
required_providers {
google = {
source  = "hashicorp/google"
version = "~> 5.0"
}
}
}



resource "google_service_account" "my_sa" {
account_id   = "sa-cloudbuild-runner"
display_name = "Cloud Build Runner Service Account"
}

resource "google_project_iam_member" "sa_binding" {
project = "gcp-prj-sys-cicd-dev"
role    = "roles/storage.objectViewer"
member  = "serviceAccount:${google_service_account.my_sa.email}"
}

output "service_account_email" {
description = "The email of the newly created service account."
value       = google_service_account.my_sa.email
}
