resource "digitalocean_certificate" "cert" {
  name       = "devops-77"
  type       = "lets_encrypt"
  domains    = [var.site_name]
  depends_on = [digitalocean_domain.info]
}

resource "digitalocean_domain" "info" {
  name = var.site_name
}

resource "digitalocean_loadbalancer" "public" {
  name                   = "loadbalancer-1"
  region                 = "ams3"
  redirect_http_to_https = true

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }

  healthcheck {
    port     = 80
    protocol = "http"
    path     = "/"
  }

  droplet_ids = [for droplet in data.digitalocean_droplets.all.droplets : droplet.id]
}