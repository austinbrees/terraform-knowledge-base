data "google_cloudbuild_trigger" "existing" {
  project      = var.project
  trigger_id   = "ahb-cloud-challenge-build"
  location     =  var.location
}

resource "google_cloud_run_service" "flask_app" {
  name     = "my-cloud-run-service"
  location = var.location

  template {
    spec {
      containers {
        image = "gcr.io/my-project/my-container-image"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }


  }


