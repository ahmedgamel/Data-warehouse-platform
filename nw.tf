# Define a virtual network and a subnet for the data platform
resource "azurerm_virtual_network" "ds_vnet" {
  name                = "DSO_VNET"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.data_seller.name
}

resource "azurerm_subnet" "ds_subnet" {
  name                 = "DSO_Subnet"
  resource_group_name  = azurerm_resource_group.data_seller.name
  virtual_network_name = azurerm_virtual_network.ds_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
