# Azure SQL Server
resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0" # or the latest supported version
  administrator_login          = "sqladmin"
  administrator_login_password = var.sql_admin_password

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "UAT"
  }
}

# Azure SQL Database (IT Database)
resource "azurerm_sql_database" "it_database" {
  name                = "ITDatabase" # Name of the IT database
  resource_group_name = azurerm_sql_server.sql_server.resource_group_name
  location            = azurerm_sql_server.sql_server.location
  server_name         = azurerm_sql_server.sql_server.name

  sku_name = "S0" # Adjust based on  performance and cost

  tags = {
    environment = "UAT"
  }
}

# Firewall Rule to Allow Azure Services Access
resource "azurerm_sql_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  resource_group_name = azurerm_sql_server.sql_server.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# AAD Admin for SQL Server (optional, if AAD integration is required)
resource "azurerm_sql_active_directory_administrator" "sql_aad_admin" {
  server_name         = azurerm_sql_server.sql_server.name
  resource_group_name = var.resource_group_name
  login               = "AADAdmin" # Replace with AAD Admin username
  tenant_id           = var.tenant_id
  object_id           = "your-aad-admin-object-id" # Replace with AAD Admin object ID
}
