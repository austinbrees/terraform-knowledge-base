terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_record" "a_record" {
  zone_id = var.cloudflare_zone_id
  name    = var.domain_name
  value   = var.ip_address
  type    = "A"
  ttl     = 1

  lifecycle {
    ignore_changes = all
  }
}

resource "cloudflare_record" "cname_record" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  value   = "${var.domain_name}."
  type    = "CNAME"
  proxied = false
  ttl     = 1

  lifecycle {
    ignore_changes = all
  }
}

