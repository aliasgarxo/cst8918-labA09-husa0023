terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }

  backend "local" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "test_rg" {
  name     = "cst8918-resourceGroup"
  location = "East US"
}

resource "azurerm_storage_account" "test_storage" {
  name                     = "cst8918laba03"
  resource_group_name      = azurerm_resource_group.test_rg.name
  location                 = azurerm_resource_group.test_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
