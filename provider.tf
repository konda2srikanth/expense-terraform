provider "aws" {}

terraform {
  backend "s3" {}
}

provider "vault" {
  address         = "https://34.239.128.124:8200"
  token           = var.vault_token
  skip_tls_verify = true
}