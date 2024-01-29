data "ansiblevault_path" "digital_ocean_token" {
  path = "vault.yml"
  key  = "digital_ocean_token"
}

data "digitalocean_droplets" "all" {
  filter {
    key    = "size"
    values = ["s-1vcpu-1gb"]
  }
  depends_on = [digitalocean_droplet.web1, digitalocean_droplet.web2]
}

data "digitalocean_database_cluster" "postgres-database" {
  name = digitalocean_database_cluster.postgres-cluster.name
}