# Azure Data Factory
resource "azurerm_data_factory" "adf" {
  name                = var.adf_name
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type = "SystemAssigned"
  }

  github_configuration {
    account_name   = "ahmedgamel"
    repository_name = "Data-warehouse-platform"
    branch_name     = "main"
    root_folder     = "/ADF_pipelines"  # the location of the Pipeline
    git_url         = "https://github.com:ahmedgamel/Data-warehouse-platform.git"
    authorization   = "github-personal-access-token"
  }

  tags = {
    environment = "UAT"
  }
}

# Linked Service for Azure SQL
resource "azurerm_data_factory_linked_service_sql_server" "sql_linked_service" {
  name                 = "SqlServerLinkedService"
  resource_group_name  = azurerm_data_factory.adf.resource_group_name
  data_factory_name    = azurerm_data_factory.adf.name
  connection_string    = "Server=tcp:${azurerm_sql_server.sql.fully_qualified_domain_name};Database=YourDatabase;User ID=${var.sql_admin_username};Password=${var.sql_admin_password};Trusted_Connection=False;Encrypt=True;Connection Timeout=30;"

  key_vault_connection {
    linked_service_name = azurerm_data_factory_linked_service_key_vault.kv_linked_service.name
    akv_url             = azurerm_key_vault.kv.vault_uri
    service_principal_id_secret_name = "your-service-principal-id-secret-name"
    service_principal_key_secret_name = "your-service-principal-key-secret-name"
    tenant_id = var.tenant_id
  }
}

# Linked Service for Azure Data Lake Storage Gen2
resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "adls_linked_service" {
  name                 = "AdlsGen2LinkedService"
  resource_group_name  = azurerm_data_factory.adf.resource_group_name
  data_factory_name    = azurerm_data_factory.adf.name
  url                  = azurerm_storage_account.adls_account.primary_blob_endpoint
  tenant               = var.tenant_id
  use_managed_identity = true
}

# Azure Key Vault Linked Service (for securely storing connection strings and secrets)
resource "azurerm_data_factory_linked_service_key_vault" "kv_linked_service" {
  name                 = "KeyVaultLinkedService"
  resource_group_name  = azurerm_data_factory.adf.resource_group_name
  data_factory_name    = azurerm_data_factory.adf.name
  key_vault_id         = azurerm_key_vault.kv.id
}

# Diagnostic Settings for Azure Data Factory
resource "azurerm_monitor_diagnostic_setting" "adf_diagnostics" {
  name                       = "adfDiagnostics"
  target_resource_id         = azurerm_data_factory.adf.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "ActivityRuns"
    enabled  = true

    retention_policy {
      days    = 0
      enabled = false
    }
  }

  log {
    category = "PipelineRuns"
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
