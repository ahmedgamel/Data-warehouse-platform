# Azure Key Vault
resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  soft_delete_enabled        = true
  purge_protection_enabled   = true

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }

  tags = {
    environment = "UAT"
  }
}

# Sample Secret for SQL Server Administrator Password
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "SqlAdminPassword"
  value        = "your-strong-password-here" # Replace with actual strong password
  key_vault_id = azurerm_key_vault.kv.id
}

# Sample Secret for Azure Data Factory
resource "azurerm_key_vault_secret" "adf_secret" {
  name         = "AdfSecret"
  value        = "some-secret-value" # Replace with actual secret value
  key_vault_id = azurerm_key_vault.kv.id
}

# Sample Key (for example, used in encryption scenarios)
resource "azurerm_key_vault_key" "sample_key" {
  name         = "SampleKey"
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

# Diagnostic Settings for Azure Key Vault
resource "azurerm_monitor_diagnostic_setting" "kv_diagnostics" {
  name                       = "kvDiagnostics"
  target_resource_id         = azurerm_key_vault.kv.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "AuditEvent" # Common category for Key Vault
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

