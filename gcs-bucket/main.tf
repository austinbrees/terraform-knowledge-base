resource "google_storage_bucket" "website" {
  name     = var.bucket_name
  location = var.bucket_location
  force_destroy = true
  uniform_bucket_level_access = false

  website {
    main_page_suffix = var.main_page_suffix
  }
}


