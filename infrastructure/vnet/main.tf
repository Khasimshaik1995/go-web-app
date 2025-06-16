resource "azurerm_virtual_network" "main" {
  name = "vnet-1"
  location = var.location
  resource_group_name = var.rg_name
  address_space = var.address_space
  tags = var.tags
}
