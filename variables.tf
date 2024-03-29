variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region in which to create the resources"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = string
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID for Azure resources"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID for Azure resources"
  type        = string
}

variable "client_id" {
  description = "The client ID for Azure resources"
  type        = string
}

variable "client_secret" {
  description = "The client secret for Azure resources"
  type        = string
}

variable "kv_name" {
  description = "The name of the key vault"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "sql_admin_password" {
  description = "The admin password for the SQL server"
  type        = string
}

variable "adf_name" {
  description = "The name of the Azure Data Factory"
  type        = string
}

variable "adls_name" {
  description = "The name of the Azure Data Lake Storage account"
  type        = string
}

variable "synapse_name" {
  description = "The name of the Azure Synapse workspace"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "sql_admin_username" {
  description = "The admin username for the SQL server"
  type        = string
}

variable "adf_sql_connection_string" {
  description = "Connection string for Azure Data Factory to connect to SQL Server"
  type        = string
}

variable "adf_secret_value" {
  description = "Secret value for Azure Data Factory"
  type        = string
}

variable "service_principal_id_secret_name" {
  description = "Secret name for the service principal ID in Azure Data Factory"
  type        = string
}

variable "service_principal_key_secret_name" {
  description = "Secret name for the service principal key in Azure Data Factory"
  type        = string
}

variable "adls_filesystem_raw_name" {
  description = "The name of the raw data filesystem in Azure Data Lake Storage"
  type        = string
}

variable "adls_filesystem_curated_name" {
  description = "The name of the curated data filesystem in Azure Data Lake Storage"
  type        = string
}

variable "adls_filesystem_processed_name" {
  description = "The name of the processed data filesystem in Azure Data Lake Storage"
  type        = string
}

variable "synapse_sql_admin_login" {
  description = "SQL administrator login for Azure Synapse"
  type        = string
}

variable "synapse_sql_admin_password" {
  description = "SQL administrator password for Azure Synapse"
  type        = string
}

variable "synapse_sql_pool_name" {
  description = "Name of the SQL pool in Azure Synapse"
  type        = string
}

variable "synapse_spark_pool_name" {
  description = "Name of the Spark pool in Azure Synapse"
  type        = string
}

variable "synapse_integration_runtime_name" {
  description = "Name of the integration runtime in Azure Synapse"
  type        = string
}

variable "adf_sql_connection_string" {
  description = "Connection string for Azure Data Factory to connect to SQL Server"
  type        = string
}

variable "adf_secret_value" {
  description = "Secret value for Azure Data Factory"
  type        = string
}

variable "service_principal_id_secret_name" {
  description = "Secret name for the service principal ID in Azure Data Factory"
  type        = string
}

variable "service_principal_key_secret_name" {
  description = "Secret name for the service principal key in Azure Data Factory"
  type        = string
}

variable "diagnostic_setting_name" {
  description = "Common name for diagnostic settings in various resources"
  type        = string
  default     = "defaultDiagnostics"
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace for diagnostic settings"
  type        = string
}

variable "log_category" {
  description = "Log category for diagnostic settings"
  type        = string
}

variable "aad_admin_username" {
  description = "The Azure Active Directory Admin username for SQL Server"
  type        = string
}

variable "aad_admin_object_id" {
  description = "The object ID for the Azure Active Directory Admin for SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
}

variable "sql_database_sku_name" {
  description = "The SKU name of the SQL database"
  type        = string
}

variable "firewall_rule_name" {
  description = "The name of the SQL server firewall rule"
  type        = string
}

variable "start_ip_address" {
  description = "The starting IP address for the SQL server firewall rule"
  type        = string
}

variable "end_ip_address" {
  description = "The ending IP address for the SQL server firewall rule"
  type        = string
}

variable "synapse_storage_data_lake_gen2_filesystem_id" {
  description = "Storage Data Lake Gen2 Filesystem ID for Synapse"
  type        = string
}
