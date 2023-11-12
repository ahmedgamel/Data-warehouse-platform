resource "azurerm_virtual_network" "vnet" {
 name = var.vnet_name
 address_space = [var.address_space]
 location = var.location
 resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
 name = var.subnet_name
 resource_group_name = var.resource_group_name
 virtual_network_name = azurerm_virtual_network.vnet.name
 address_prefixes = [var.subnet_prefix]
}

# Diagnostic Settings for Azure Virtual Network
resource "azurerm_monitor_diagnostic_setting" "vnet_diagnostics" {
  name                       = "vnetDiagnostics"
  target_resource_id         = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "VMProtectionAlerts" # Replace with actual log category for VNet
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
