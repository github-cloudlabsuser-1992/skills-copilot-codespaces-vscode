provider "azurerm" {
  features {}
}

variable "location" {
  description = "The location/region in which to create the storage account"
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
}

variable "account_tier" {
  description = "Defines the Tier of this storage account"
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account"
  default     = "LRS"
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_resource_group" "example" {
  name     = "${var.storage_account_name}rg"
  location = var.location
}