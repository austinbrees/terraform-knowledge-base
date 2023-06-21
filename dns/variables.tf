variable "cloudflare_api_token" {
  description = "API key for Cloudflare API authentication"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "ID of the Cloudflare DNS zone"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the DNS record"
  type        = string
}
variable "global_address_name" {
  description = "Name of the global address resource."
  type        = string
}
variable "ip_address" {
  description = "The IP address of the load balancer"
  type        = string
}