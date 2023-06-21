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
      path = "terraform/api-gateway/api-spec.yaml"
      contents = filebase64("api-gateway/api-spec.yaml")
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