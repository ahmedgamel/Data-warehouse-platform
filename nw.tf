# Define a virtual network and a subnet for the data platform
resource "azurerm_virtual_network" "dso_vnet" {
  name                = "DSO_VNET_UAT"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dso_rg.location
  resource_group_name = azurerm_resource_group.dso_rg.name
}

resource "azurerm_subnet" "dso_subnet" {
  name                 = "DSO_Subnet_UAT"
  resource_group_name  = azurerm_resource_group.data_seller_rg.name
  virtual_network_name = azurerm_virtual_network.data_seller_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
