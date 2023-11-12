# Configuration for Azure Data Factory
resource "azurerm_monitor_diagnostic_setting" "adf_diagnostics" {
  name                       = "adfDiagnostics"
  target_resource_id         = azurerm_data_factory.adf.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "ActivityRuns"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "PipelineRuns"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}

# Configuration for Azure key vault
resource "azurerm_monitor_diagnostic_setting" "kv_diagnostics" {
  name                       = "kvDiagnostics"
  target_resource_id         = azurerm_key_vault.kv.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}

# Configuration for Azure synapse
resource "azurerm_monitor_diagnostic_setting" "synapse_diagnostics" {
  name                       = "synapseDiagnostics"
  target_resource_id         = azurerm_synapse_workspace.synapse.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "SynapseRbacOperations"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}

# Configuration for Azure SQL Server
resource "azurerm_monitor_diagnostic_setting" "sql_diagnostics" {
  name                       = "sqlDiagnostics"
  target_resource_id         = azurerm_sql_server.sql.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "DatabaseWaitStatistics"
    enabled  = true
  }

  log {
    category = "SQLInsights"
    enabled  = true
  }

  metric {
    category = "Basic"
    enabled  = true
  }

  metric {
    category = "InstanceAndAppAdvanced"
    enabled  = true
  }
}

# Configuration for Azure Data Lake Store
resource "azurerm_monitor_diagnostic_setting" "adls_diagnostics" {
  name                       = "adlsDiagnostics"
  target_resource_id         = azurerm_data_lake_store.adls.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "Audit"
    enabled  = true
  }

  log {
    category = "Request"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}

# Configuration for Azure Virtual Network
resource "azurerm_monitor_diagnostic_setting" "vnet_diagnostics" {
  name                       = "vnetDiagnostics"
  target_resource_id         = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "VMProtectionAlerts"
    enabled  = true
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
