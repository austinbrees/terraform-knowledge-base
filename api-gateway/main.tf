resource "google_api_gateway_api" "api_gw" {
  provider = google-beta
  api_id = var.api_id
}

resource "google_api_gateway_api_config" "api_gw" {
  provider = google-beta
  api = google_api_gateway_api.api_gw.api_id
  api_config_id = var.config_id

  openapi_documents {
    document {
    path = "api-spec.yml"
    contents = filebase64("api-spec.yml")

    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "google_api_gateway_gateway" "api_gw" {
  provider = google-beta
  api_config = google_api_gateway_api_config.api_gw.id
  gateway_id = var.gateway_id
}