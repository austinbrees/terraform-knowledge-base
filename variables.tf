variable "global_address_name" {
  description = "Name of the global address resource."
  type        = string
}

variable "ssl_certificate_name" {
  description = "Name of the SSL certificate resource."
  type        = string
}

variable "domain_name" {
  description = "Your domain name for which the SSL certificate will be activated."
  type        = string
}

variable "https_proxy_name" {
  description = "Name of the HTTPS proxy resource."
  type        = string
}

variable "forwarding_rule_name" {
  description = "Name of the forwarding rule resource."
  type        = string
}

variable "cloudflare_api_token" {
  description = "API key for Cloudflare API authentication"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "ID of the Cloudflare DNS zone"
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the DNS zone"
  type        = string
}

variable "dns_name" {
  description = "The name of the DNS"
  type        = string
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "The location of the GCS bucket"
  type        = string
}
variable "project" {
  description = "The project ID to deploy to"
  type        = string
}
variable "region" {
  description = "The region to deploy to"
  type        = string
}
variable "location_id" {
  description = "The region to deploy to"
  type        = string
}
variable "service_account_email" {
  description = "The email address of the service account"
  type        = string
}
variable "repository" {
  description = "The name of the Cloud Source Repository"
  type        = string

}
variable "location" {
  description = "value for location"
  type        = string
}
variable "api_id" {
  description = "The ID of the API to create"
  default     = "backend-service-api"
}

variable "config_id" {
  description = "The ID of the API Config to create"
  default     = "backend-api-config-v2"
}

variable "gateway_id" {
  description = "The ID of the Gateway to create"
  default     = "backend-service-api-gateway"
}


variable "service_account" {
  description = "The service account for the API Gateway"
  default     = "my-service-account@my-project-id.iam.gserviceaccount.com"
}
variable "image" {
  description = "The URL of the container image"
  type        = string
}
variable "credentials" {
  description = "The credentials for the service account"
  type        = string
}