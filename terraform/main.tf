
module "rgroup" {
  source              = "./modules/rgroup"
  resource_group_name = "4945-assignment1-RG"
  location      = "canadacentral"
  resource_tags = local.resource_tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  vnet_name           = "vnet-4945"
  vnet_addr_space     = ["10.0.0.0/16"]
  subnet_name         = "subnet-4945"
  subnet_addr_space   = ["10.0.1.0/24"]
}


module "common" {
  source                       = "./modules/common"
  resource_group_name          = module.rgroup.rg_name_out
  location                     = module.rgroup.location_out
  resource_tags                = local.resource_tags
  log_analytics_workspace_name = "log-analytics-workspace-4945"
  recovery_svc_vault = {
    name              = "recovery-service-vault-4945"
    sku               = "Standard"
    storage_mode_type = "LocallyRedundant" // as default is GeoRedundant
  }
  storage_account_name = "storageaccount4945"
}

module "vmlinux" {
  source              = "./modules/vmlinux"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  linux_avs_name      = "linux_AVS_4945"
  vm_count            = 2
  vm = {
    name = "linux4945"
    size = "Standard_B1s"
  }
  subnet_id                         = module.network.subnet_id_out
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_out
}

module "vmwindows" {
  source              = "./modules/vmwindows"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  windows_avs_name    = "windows_AVS_4945"
  vm = {
    name = "window4945"
    size = "Standard_B1s"
  }
  subnet_id                         = module.network.subnet_id_out
  boot_diagnostics_storage_endpoint = module.common.storage_account_blob_endpoint_out
}

module "datadisk" {
  source              = "./modules/datadisk"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  data_disk_count     = 3
  data_disk_name      = "data_disk4945"
  data_disk_properties = {
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }
  linux_vm_ids  = module.vmlinux.vm_ids_out
  windows_vm_id = module.vmwindows.vm_id_out
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  load_balancer_name  = "load-balancer4945"
  linux_vm_nics       = module.vmlinux.vm_nics_out
}

module "database" {
  source              = "./modules/database"
  resource_group_name = module.rgroup.rg_name_out
  location            = module.rgroup.location_out
  resource_tags       = local.resource_tags
  name                = "postgres-4945"
  server_sku_name     = "B_Gen5_1"
}