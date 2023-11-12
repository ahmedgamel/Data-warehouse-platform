module "resource_group" {
 source = "./rg"
 name = var.resource_group_name
 location = var.location
}

module "network" {
 source = "./nw"
 vnet_name = var.vnet_name
 subnet_name = var.subnet_name
 address_space = var.address_space
 subnet_prefix = var.subnet_prefix
 resource_group_name = var.resource_group_name
}
