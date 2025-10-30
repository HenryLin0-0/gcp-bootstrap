resource "google_storage_bucket" "my_bucket" {

name = "bucket-gcp-prj-sys-cicd-dev-data-store"

location      = "ASIA-EAST1"

storage_class = "STANDARD"

versioning {
enabled = true
}

encryption {
    default_kms_key_name = "projects/gcp-prj-sys-cicd-dev/locations/asia-east1/keyRings/henry-test2/cryptoKeys/henry-cmek-key-2"
  }


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

/*
resource "google_kms_crypto_key_iam_member" "key_dat_enc_dec" {
  for_each = toset([
    "serviceAccount:service-297266907191@gs-project-accounts.iam.gserviceaccount.com",
   ])
  crypto_key_id = "henry-cmek-key-2"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = each.key
}
*/
