output "vm_hostnames_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].computer_name
}

output "private_ips_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].private_ip_address
}

output "public_ips_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].public_ip_address
}

# To be used in Data Disk Module
output "vm_ids_out" {
  value = azurerm_linux_virtual_machine.linux_vm[*].id
}

# To be used in Load Balancer Module
output "vm_nics_out" {
  value = azurerm_network_interface.network_interface[*]
}


