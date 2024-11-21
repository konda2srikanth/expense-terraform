provider "aws" {}

terraform {
  backend "s3" {}
}

provider "vault" {
  address         = "https://vault.expense.internal:8200"
  token           = var.vault_token
  skip_tls_verify = true
}