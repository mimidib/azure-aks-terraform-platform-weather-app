terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "githubactions-rg" {
  name     = "${var.gha-prefix}-rg"
  location = "East US"
}

resource "azurerm_storage_account" "githubactions" {
  name                     = "${var.gha-prefix}dib00016"
  resource_group_name      = azurerm_resource_group.githubactions-rg.name
  location                 = azurerm_resource_group.githubactions-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "tfstate" {
  storage_account_id    = azurerm_storage_account.githubactions.id
  name                  = "tfstate-cont"
  container_access_type = "private"
}

output "backend-rg-name" {
  value       = azurerm_resource_group.githubactions-rg.name
  description = "Name of the tf-backend resource group."
}

output "backend-sa-name" {
  value       = azurerm_storage_account.githubactions.name
  description = "Name of the tf-backend storage account."
}

output "backend-cont-name" {
  value       = azurerm_storage_container.tfstate.name
  description = "Name of the backend storage container name."
}

output "backend-sa-primary-access-key" {
  value       = azurerm_storage_account.githubactions.primary_access_key
  sensitive   = true
  description = "Primary access key of the tf-backend storage account."
}
