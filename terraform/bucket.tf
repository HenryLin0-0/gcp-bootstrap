resource "google_storage_bucket" "my_bucket" {

name = "bucket-gcp-prj-sys-cicd-dev-data-store"

location      = "ASIA-EAST1"

storage_class = "STANDARD"

versioning {
enabled = true
}

default_object_acl = []

uniform_bucket_level_access = true

lifecycle_rule {
action {
type = "SetStorageClass"
storage_class = "NEARLINE"
}

condition {
age = 30
}
}

force_destroy = true
}
