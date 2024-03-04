#Terraform Script
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

#create a resource group
resource "azurerm_resource_group" "rg-tf" {
  name = "rg-win-prod"
  location = "eastus"
  
}

# create a virtual network within the resource group

resource "azurerm_virtual_network" "vnet" {
  name = "vnet-win"
  resource_group_name = azurerm_resource_group.rg-tf
  location = azurerm_resource_group.eastus
  address_space = ["10.0.0.0/16"]  
}

# Deploy subnet 
resource "azurerm_subnet" "sub01" {
  name                 = "sub-prd01"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.0.1.0/16"]
}

