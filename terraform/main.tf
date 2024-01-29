terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    ansiblevault = {
      source  = "MeilleursAgents/ansiblevault"
      version = "~> 2.0"
    }

  }
}