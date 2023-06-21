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
variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}