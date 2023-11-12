resource "azurerm_sql_server" "data_seller_sql" {
  name                         = "DSO_SQL_UAT"
  resource_group_name          = azurerm_resource_group.data_seller_rg.name
  location                     = azurerm_resource_group.data_seller_rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password.value

  # Enabling Azure Defender for SQL
  threat_detection_policy {
    enabled = true
    email_addresses = ["security@DSO.com"] # Replace with actual email addresses
    retention_days = 30
    use_server_default = "Disabled"
  }

  # Networking settings
  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.audit_storage.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.audit_storage.primary_access_key
    storage_account_access_key_is_secondary = false
    retention_in_days                       = 90
  }

  tags = {
    environment = "UAT"
  }
}

# SQL firewall rule to allow specific IP ranges or Azure services
resource "azurerm_sql_firewall_rule" "data_seller_sql_firewall" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = azurerm_sql_server.data_seller_sql.resource_group_name
  server_name         = azurerm_sql_server.data_seller_sql.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0" # Use appropriate IP ranges
}

# Retrieve SQL Server admin password from Key Vault
data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sqlAdminPassword"
  key_vault_id = azurerm_key_vault.data_seller_kv.id
}

# Configure an Azure SQL Database
resource "azurerm_sql_database" "data_seller_sql_db" {
  name                = "DataSellerDB"
  resource_group_name = azurerm_sql_server.data_seller_sql.resource_group_name
  server_name         = azurerm_sql_server.data_seller_sql.name
  requested_service_objective_name = "S0"
}
