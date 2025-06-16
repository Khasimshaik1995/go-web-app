terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.96.0"
    }
  }
  required_version = ">= 1.1.0"
}


provider "azurerm" {
  features {}

  subscription_id = var.subscription
}