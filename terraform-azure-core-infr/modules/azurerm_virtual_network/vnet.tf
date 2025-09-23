resource "azurerm_virtual_network" "virtual-network" {
  for_each = var.vnet
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.key.r_g_n
}
