resource "azurerm_resource_group" "rg" {
  for_each = var.resource-group
  name     = each.value.name
  location = each.value.location
}