# Creating a Resource Group
resource "azurerm_resource_group" "resource_grp" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.resource_tags
}