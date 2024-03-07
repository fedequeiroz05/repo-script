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