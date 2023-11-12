# Azure Data Lake Store Gen2 Account
resource "azurerm_storage_account" "adls_account" {
  name                     = var.adls_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true

  tags = {
    environment = "UAT"
  }
}

# Filesystem for Raw Data
resource "azurerm_storage_data_lake_gen2_filesystem" "raw" {
  name               = "raw"
  storage_account_id = azurerm_storage_account.adls_account.id
}

# Filesystem for Curated Data
resource "azurerm_storage_data_lake_gen2_filesystem" "curated" {
  name               = "curated"
  storage_account_id = azurerm_storage_account.adls_account.id
}

# Filesystem for Processed Data
resource "azurerm_storage_data_lake_gen2_filesystem" "processed" {
  name               = "processed"
  storage_account_id = azurerm_storage_account.adls_account.id
}

# Example of setting access control at the filesystem level
resource "azurerm_storage_data_lake_gen2_path" "example_path" {
  path               = "/"
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.raw.name
  storage_account_id = azurerm_storage_account.adls_account.id
  resource           = "filesystem"

  ace {
    id       = "your-azure-ad-object-id"
    type     = "user"
    permissions = "rwx"
  }
}


# Diagnostic Settings for Azure Data Lake Storage
resource "azurerm_monitor_diagnostic_setting" "adls_diagnostics" {
  name                       = "adlsDiagnostics"
  target_resource_id         = azurerm_storage_account.adls_account.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "StorageDelete"
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
