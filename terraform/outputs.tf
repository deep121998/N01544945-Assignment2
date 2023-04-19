# rgroup module outputs
output "resource_group_name" {
  value       = module.rgroup.rg_name_out
  description = "This output variable will output the  Resource Group name"
}

output "location" {
  value       = module.rgroup.location_out
  description = "This output variable will output the Location in which all the resources will be deployed"
}

# network module outputs 
output "vnet_name" {
  value       = module.network.vnet_name_out
  description = "This output variable will output the name of the Virtual Network"
}

output "subnet_name" {
  value       = module.network.subnet_name_out
  description = "This output variable will output the naame of the Subnet created"
}

# common module outputs
output "log_workspace_analytics_name" {
  value       = module.common.log_analytics_workspace_out
  description = "This output variable will output the name of the Log Analytics Workspace"
}

output "recovery_svc_vault_name" {
  value       = module.common.recovery_svc_vault_name_out
  description = "This output variable will output the name of the Recovery Service Vault"
}

output "storage_account_out_name" {
  value       = module.common.storage_account_name_out
  description = "This output variable will output the name of the Strorage Account created"
}

output "storage_account_blob_endpoint_out" {
  value       = module.common.storage_account_blob_endpoint_out
  description = "This output variable will output the blob endpoint of Storage Account."
}


# vmlinux module outputs
output "linux_hostnames" {
  value       = module.vmlinux.vm_hostnames_out
  description = "This output variable will output the names hostnames of the linux VMs that are created "
}

output "linux_private_ips" {
  value       = module.vmlinux.private_ips_out
  description = "This output variable will output the names hostnames of the Private IPs of the VMs that are created "
}

output "linux_public_ips" {
  value       = module.vmlinux.public_ips_out
  description = "This output variable will output the names hostnames of the Public IPs of the VMs that are created "
}


# vmwindows module output
output "windows_hostname" {
  value       = module.vmwindows.vm_hostname_out
  description = "This output variable will name of the created windows VMs "
}

output "windows_private_ip" {
  value       = module.vmwindows.private_ip_out
  description = "This output variable will output the name hostnames of the Private IPs of the windows VMs"
}

output "windows_public_ip" {
  value       = module.vmwindows.public_ip_out
  description = "This output variable will output the name hostnames of the Publlic IP of the windows VM"
}

# loadbalancer module outputs
output "load_balancer_name" {
  value       = module.loadbalancer.load_balancer_name_out
  description = "This output variable will output the name of the Load Balancer"
}

output "load_balancer_FQDN" {
  value       = module.loadbalancer.load_balancer_FQDN_out
  description = "This output variable will output the FQDN of the Load Balancer"
}

# database module outputs
output "database_name" {
  value       = module.database.postgres_db_name_out
  description = "This output variable will output the name of the PostgreSQL Database"
}
