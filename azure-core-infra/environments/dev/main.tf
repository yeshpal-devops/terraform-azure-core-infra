# resource-group

module "rg" {
  source = "../../modules/azurerm_resource_group"
  resource-group = var.azurerm_resource_group
}

#stg

module "stg" {
    depends_on = [ module.rg ]
  source = "../../modules/azurerm_storage_account"
  stg = var.stg
}
#vnet

module "vnet" {
    depends_on = [ module.rg , module.stg]
  source = "../../modules/azurerm_virtual_network"
vnet = var.vnet
}

#subnet

module "subnet" {
    depends_on = [ module.rg ,module.vnet ]
  source = "../../modules/azurerm_subnet"
  subnet-infra = var.subnet
}

#nic

module "nic" {
  source = "../../modules/azurerm_network_interface"
}

#vm

module "vm" {
  depends_on = [ module.rg , module.vnet ,module.stg,module.nic,module.stg ]
  source = "../../modules/azurerm_virtual_machine"
  vm = var.vm
}