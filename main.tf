terraform {
  required_version = ">= 0.13"

  backend "azurerm" {
    resource_group_name  = "DSO_RG_UAT"
    storage_account_name = "dsostorageaccount"
    container_name       = "tfstate"
    key                  = "main.terraform.tfstate"
  }
}
