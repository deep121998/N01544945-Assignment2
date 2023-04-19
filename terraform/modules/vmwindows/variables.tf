
variable "resource_group_name" {
  description = "This variable will store the name of the Resource Group (passed from the root module, comes from rgroup module) "
}

variable "location" {
  description = "This variable will store the location where the Resource Group will be created (passed from the root module, comes from rgroup module) "
}

variable "resource_tags" {
  description = "This variable will store the value of tags which will be assigned to the all the resources in this module (passed from the root module)"
}

variable "windows_avs_name" {
  description = "This variable will store the name of Availability Set where Windows VM will be provisioned (passed from the root module)"
}

variable "subnet_id" {
  description = "This variable will store the ID of the subnet which is required in the Network Interfaces (passed from the root module, comes from network module)"
}

variable "boot_diagnostics_storage_endpoint" {
  description = "This variable will store the blob endpoint for boot diagnostics (passed from the root module, created in common module)"
}

variable "vm" {
  type        = map(string)
  description = "This variable stores the name and size of the Virtual Machine that will be created (passed from the root module) "
}

variable "os_info" {
  type = map(string)

  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  description = "This variable defines the attributes of the OS which we will use in our Windows VM"
}


variable "os_disk" {
  type = map(string)

  default = {
    account_type = "Standard_LRS"
    disk_size    = "127"
    caching      = "ReadWrite"
  }

  description = "This variable defines all the attribute of the OS disk"
}

variable "admin_user" {
  type = map(string)

  default = {
    username = "admindeep"
    password = "Deep@2960"
  }
  sensitive   = true
  description = "This defines the attributes of the user that will be used to login into the Windows VM"
}

variable "extension_properties" {
  type = map(string)
  default = {
    name                 = "Antimalware_Extension_4945"
    publisher            = "Microsoft.Azure.Security"
    type                 = "IaaSAntimalware"
    type_handler_version = "1.5"
  }
  description = "This variable stores all the properties required for the Antimalware Extension."
}
