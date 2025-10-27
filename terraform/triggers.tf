resource "google_cloudbuild_trigger" "test_trigger" {
name    = "test1000"
project = "gcp-prj-sys-cicd-dev"
location = "global"
service_account = "projects/gcp-prj-sys-cicd-dev/serviceAccounts/297266907191-compute@developer.gserviceaccount.com"

github {
owner = "HenryLin"
name  = "gcp-bootstrap"
push {
# 註釋：設定為監聽 'main' 分支的推動事件 (PUSH Event)
branch = "main"
# 若要監聽所有分支，請使用 branch = ".*"
}
}

filename = "cloudbuild.yaml"
}


output "trigger_id" {
description = "The unique ID of the created Cloud Build Trigger."
value       = google_cloudbuild_trigger.test_trigger.id
}
