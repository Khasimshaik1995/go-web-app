terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatehasan"
    container_name       = "tfstate"
    key                  = "go-web-app.terraform.tfstate"
    subscription_id      = "fc4b0a21-cf38-4354-9ee7-f3532dd03c57"
  }
}

