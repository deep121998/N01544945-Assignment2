terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01544945RG"
    storage_account_name = "tfstaten01544945sa"
    container_name       = "tfstatefiles"
    key                  = "assignment2"
  }
}