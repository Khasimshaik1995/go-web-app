resource "azurerm_resource_group" "main" {
  name     = "${local.project_name}-prod"
  location = var.location
  tags     = local.tags
}


resource "azurerm_kubernetes_cluster" "main" {
  name                = "main-aks-1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "mainaks1"
  tags                = local.tags

  default_node_pool {
    name       = "default"
    node_count = 4
    vm_size    = "Standard_D2_v2"

  }

  identity {
    type = "SystemAssigned"
  }
}