terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.39.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.12.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "vault"
    key                  = "vault.tfstate"
  }
}

provider "vault" {
  address = "https://vault.demo.catena-x.net"
}

provider "azurerm" {
  features {}
}