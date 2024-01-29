data "digitalocean_ssh_key" "key" {
  name = "devops-77"
}

resource "digitalocean_droplet" "web1" {
  image  = "ubuntu-22-04-x64"
  name   = "web-1"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.key.id,
  ]
}

resource "digitalocean_droplet" "web2" {
  image  = "ubuntu-22-04-x64"
  name   = "web-2"
  region = "ams3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.key.id,
  ]
}