provider "digitalocean" {
  token = data.ansiblevault_path.digital_ocean_token.value
}

provider "ansiblevault" {
  vault_path  = "vault-password-file"
  root_folder = "./"
}