
# Create Synapse Workspace
resource "azurerm_synapse_workspace" "synapse" {
  name                                 = var.synapse_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.example.id
  sql_administrator_login              = "sqladminuser" # link it to KV
  sql_administrator_login_password     = "add@Password" # link it to KV

  aad_admin {
    login     = "AzureAD Admin"
    object_id = "00000000-0000-0000-0000-000000000000"
    tenant_id = var.tenant_id
  }

  tags = {
    Env = "UAT"
  }
}

# Dedicated SQL Pool (formerly SQL Data Warehouse)
resource "azurerm_synapse_sql_pool" "sql_pool" {
  name                 = "Example-Sql-Pool"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  sku_name             = "DW100c"
  create_mode          = "Default"
  collation            = "SQL_Latin1_General_CP1_CI_AS"

  tags = {
    Env = "UAT"
  }
}

# Apache Spark Pool
resource "azurerm_synapse_spark_pool" "spark_pool" {
  name                 = "Example-Spark-Pool"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  node_size            = "Small"
  node_count           = 3
  auto_scale_enabled   = true
  auto_pause_enabled   = true
  delay_in_minutes     = 15

  tags = {
    Env = "UAT"
  }
}

# Data Integration (Integration Runtime)
resource "azurerm_synapse_integration_runtime_azure" "integration_runtime" {
  name                 = "Example-Integration-Runtime"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  type                 = "Managed"
}

