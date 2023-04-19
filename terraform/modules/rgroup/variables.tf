variable "resource_group_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module)"
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module)"
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the Resource Group (passed from the root module)"
}