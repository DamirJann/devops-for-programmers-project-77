provider "digitalocean" {
  token = data.ansiblevault_path.digital_ocean_token.value
}

provider "ansiblevault" {
  vault_path = "../ansible/vault-password"
  root_folder = "../ansible"
}

data "ansiblevault_path" "digital_ocean_token" {
  path = "vault.yml"
  key  = "digital_ocean_token"
}


