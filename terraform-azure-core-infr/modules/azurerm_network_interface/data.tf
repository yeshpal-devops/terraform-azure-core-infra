data "azurerm_subnet" "subnet" {
    for_each = var.subnet  
  name                 = each.value.name
  virtual_network_name = each.value.v_n_n
  resource_group_name  = each.value.r_g_n
}