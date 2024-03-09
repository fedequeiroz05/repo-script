#Terraform Script
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

#Deploy a resource group
resource "azurerm_resource_group" "rg-tf" {
  name     = "RG-Prod01"
  location = "eastus"
  
}

#Deploy a Azure virtual network
 resource  "azurerm_virtual_network" "vnet01" {
 name = "vnet01-prod"
 address_space = ["10.50.0.0/16"]
 location = azurerm_resource_group.rg-tf.location
 resource_group_name = azurerm_resource_group.rg-tf.name

}

#Deploy a Azure Subnet
 resource "azure_subnet" "subnet01" {
  name = "sub-prod"
  resource_group_name = azurerm_resource_group.rg-tf.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes = ["10.50.1.0/24"]  
  depends_on = [azurerm_virtual_network.vnet01]

 }

#Deploy a NSG
 resource "azure_network_security_group" "nsg01" {
  name = "nsg01-prod"
  location = azurerm_resource_group.rg-tf.location

  security_rule {
    name = "nsg-sec-prod"
    priority = 110
    direction = "Inbound"
    description = "group_security_production"
    protocol = "tcp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = "*"
    destination_adress_prefix = "*"
  }
  
  tags = {
    environmnet = "Production"
  }

  depends_on = [azure_network_security_group.nsg01]

 }