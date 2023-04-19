# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.39.0"
    }
  }
  required_version = "~> 1.4.5"
}
