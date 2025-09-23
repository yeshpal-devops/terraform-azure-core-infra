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
  depends_on = [ module.vnet ,  module.subnet]
  source = "../../modules/azurerm_network_interface"
  nic = var.nic
  subnet = var.subnet
  
}



# module for network interface card front
module "azurerm_network_interface_card_front" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source     = "../../Child/azurerm_network_interface_card"
  nic        = var.dev_frontnic
  subnet     = var.dev_data_subnet
}
#vm

module "vm" {
  depends_on = [ module.rg , module.vnet ,module.stg,module.nic,module.stg ]
  source = "../../modules/azurerm_virtual_machine"
  vm = var.vm
}