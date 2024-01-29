resource "local_file" "ansible-inventory" {
  content    = templatefile("templates/inventory.yml.tftpl", data.digitalocean_droplets.all)
  filename   = "../ansible/inventory.yml"
  depends_on = [data.digitalocean_droplets.all]
}

resource "local_file" "ansible-env" {
  content = templatefile("templates/environment.tftpl", {
    DB_TYPE = "postgres"
    DB_NAME = digitalocean_database_cluster.postgres-cluster.database
    DB_HOST = digitalocean_database_cluster.postgres-cluster.host
    DB_PORT = digitalocean_database_cluster.postgres-cluster.port
    DB_USER = digitalocean_database_cluster.postgres-cluster.user
    DB_PASS = digitalocean_database_cluster.postgres-cluster.password
  })
  filename = "../ansible/.env"
}

resource "digitalocean_database_firewall" "postgres-db-firewall" {
  cluster_id = digitalocean_database_cluster.postgres-cluster.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.web1.id
  }

  rule {
    type  = "droplet"
    value = digitalocean_droplet.web2.id
  }
}


resource "digitalocean_database_cluster" "postgres-cluster" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = 1
}