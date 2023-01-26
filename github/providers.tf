terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.39.0"
    }
    github = {
      source  = "integrations/github"
      version = "~>5.7.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cxdevsecopstfstate"
    container_name       = "github"
    key                  = "github.tfstate"
  }
}

# Configure Azure Provider
provider "azurerm" {
  features {}
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
  owner = "catenax-ng"
}
