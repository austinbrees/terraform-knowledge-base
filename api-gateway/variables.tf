variable "project_id" {
  description = "The ID of the project in which to create the API Gateway"
  default     = "my-project-id"
}

variable "api_id" {
  description = "The ID of the API to create"
  default     = "backend-service-api-v2"
}

variable "config_id" {
  description = "The ID of the API Config to create"
  default     = "backend-api-config-v2"
}

variable "gateway_id" {
  description = "The ID of the Gateway to create"
  default     = "backend-service-api-gateway"
}

variable "location" {
  description = "The location to create the resources"
  default     = "europe-west2"
}

variable "service_account" {
  description = "The service account for the API Gateway"
  default     = "my-service-account@my-project-id.iam.gserviceaccount.com"
}