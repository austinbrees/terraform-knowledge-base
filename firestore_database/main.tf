resource "google_project_service" "firestore" {
  service = "firestore.googleapis.com"
  
  lifecycle {
    ignore_changes = all
  }
}

resource "google_firestore_document" "counter" {
  collection    = "counters"
  document_id   = "my-counter"
  fields        = <<EOF
    {
      "count": {
        "integerValue": "0"
      }
    }
    EOF
  depends_on = [google_project_service.firestore]

  lifecycle {
    ignore_changes = all
  }
}
