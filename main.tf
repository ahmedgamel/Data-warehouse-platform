# Configure the Azure Provider
provider "azurerm" {
  version = "~> 2.0"
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# Resource Group
module "resource_group" {
  source = "./modules/rg"
  name   = var.resource_group_name
  location = var.location
}

# Virtual Network and Subnet
module "network" {
  source = "./modules/nw"
  vnet_name = var.vnet_name
  subnet_name = var.subnet_name
  address_space = var.address_space
  subnet_prefix = var.subnet_prefix
  resource_group_name = var.resource_group_name
}

# Azure SQL Server and Database
module "sql_server" {
  source = "./modules/sql"
  sql_server_name = var.sql_server_name
  resource_group_name = var.resource_group_name
  location = var.location
  sql_admin_username = var.sql_admin_username
  sql_admin_password = var.sql_admin_password
  sql_database_name = var.sql_database_name
  sql_database_sku_name = var.sql_database_sku_name
}

# Azure Data Factory
module "data_factory" {
  source = "./modules/adf"
  adf_name = var.adf_name
  location = var.location
  resource_group_name = var.resource_group_name
}

# Azure Data Lake Storage Gen2
module "data_lake_storage" {
  source = "./modules/adls"
  adls_name = var.adls_name
  resource_group_name = var.resource_group_name
  location = var.location
}

# Azure Synapse Analytics
module "synapse" {
  source = "./modules/synapse"
  synapse_name = var.synapse_name
  resource_group_name = var.resource_group_name
  location = var.location
  synapse_sql_admin_login = var.synapse_sql_admin_login
  synapse_sql_admin_password = var.synapse_sql_admin_password
}

# Azure Key Vault
module "key_vault" {
  source = "./modules/kv"
  kv_name = var.kv_name
  resource_group_name = var.resource_group_name
  location = var.location
  tenant_id = var.tenant_id
}

# Diagnostic Settings
module "diagnostics" {
  source = "./modules/diagnostics"
  // Pass necessary resources and configurations
}

# Azure Log Analytics Workspace
module "log_analytics" {
  source = "./modules/log_analytics"
  log_analytics_workspace_name = var.log_analytics_workspace_name
  location = var.location
  resource_group_name = var.resource_group_name
}
