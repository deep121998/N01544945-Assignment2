output "vm_hostname_out" {
  value = azurerm_windows_virtual_machine.windows_vm.computer_name
}

output "private_ip_out" {
  value = azurerm_windows_virtual_machine.windows_vm.private_ip_address
}

output "public_ip_out" {
  value = azurerm_windows_virtual_machine.windows_vm.public_ip_address
}

output "vm_id_out" {
  value = azurerm_windows_virtual_machine.windows_vm.id
}

# output "vm_dns_names" {
#   value = azurerm_public_ip.public_ip[*].fqdn
# }