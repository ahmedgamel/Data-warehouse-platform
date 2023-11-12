resource "azurerm_key_vault" "ds_kv" {
  name                        = "DSO_KV_UAT"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.data_seller.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = true

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = ["100.0.0.1/32"]
    virtual_network_subnet_ids = [azurerm_subnet.data_seller_subnet.id]
  }

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.your_object_id # Replace with the object ID of the user or service principal

    key_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "update",
      "import",
      "backup",
      "restore",
      "recover",
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete",
      "recover",
      "backup",
      "restore",
    ]

    certificate_permissions = [
      "get",
      "list",
      "create",
      "delete",
      "import",
      "update",
      "managecontacts",
      "getissuers",
      "listissuers",
      "setissuers",
      "deleteissuers",
      "manageissuers",
      "recover",
    ]

    storage_permissions = [
      "get",
      "list",
      "delete",
      "set",
      "update",
      "regeneratekey",
      "setsas",
      "listsas",
      "getsas",
      "deletesas",
    ]
  }

  # Additional access policies can be added here as needed
}

# Add secrets, keys, or certificates as required
resource "azurerm_key_vault_secret" "data_seller_secret" {
  name         = "DataSellerSecret"
  value        = "sensitive_value" # Replace with real sensitive data or reference from a secure source
  key_vault_id = azurerm_key_vault.data_seller_kv.id
}

# Example of adding a key
resource "azurerm_key_vault_key" "data_seller_key" {
  name         = "DataSellerKey"
  key_vault_id = azurerm_key_vault.data_seller_kv.id
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
