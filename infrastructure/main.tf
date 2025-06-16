resource "azurerm_resource_group" "main" {
  name     = "${local.project_name}-prod"
  location = var.location
  tags = local.tags
}

module "vnet" {
  source = "./vnet"
  address_space = [ "10.0.0.0/16" ]
  rg_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  tags = local.tags
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = "main-aks-1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "mainaks1"
  tags = local.tags

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"

  }

  identity {
    type = "SystemAssigned"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.main.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive = true
}