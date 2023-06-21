terraform { 
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
  }
  backend "gcs" {
    bucket = "cloud-resume-terraform-state"
    credentials = credentials.json

    }
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = base64decode(var.credentials)
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
provider "google-beta" {
  project     = var.project
  region      = var.region
  credentials = base64decode(var.credentials)
}
# chages made 
module "gcs-bucket" {
  source          = "./gcs-bucket"
  bucket_name     = var.bucket_name
  bucket_location = var.bucket_location
}

module "load-balancer" {
  source               = "./load-balancer"
  global_address_name  = var.global_address_name
  ssl_certificate_name = var.ssl_certificate_name
  domain_name          = var.domain_name
  https_proxy_name     = var.https_proxy_name
  forwarding_rule_name = var.forwarding_rule_name
  bucket_name          = var.bucket_name

  depends_on = [module.gcs-bucket]
}

# changes
# module "dns" {
#   source               = "./dns"
#   cloudflare_api_token = var.cloudflare_api_token
#   cloudflare_zone_id   = var.cloudflare_zone_id
#   domain_name          = var.domain_name
#   global_address_name  = var.global_address_name
#   ip_address           = module.load-balancer.ip_address
#   providers = {
#     cloudflare = cloudflare
#   }
# }


module "firestore" {
  source      = "./firestore_database"
  project     = var.project
  location_id = var.location_id
}

module "api" {
  source                = "./api"
  depends_on            = [module.firestore]
  project               = var.project
  location              = var.location
  service_account_email = var.service_account_email
  repository            = var.repository
  image                 = var.image
}

module "api-gateway" {
  source          = "./api-gateway"
  location        = var.location
  service_account = var.service_account
  gateway_id      = var.gateway_id
  depends_on      = [module.api]
}


