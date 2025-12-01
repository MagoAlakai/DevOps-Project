terraform{
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "4.54.0"
      }
    }
    #creación pipeline IaC
    backend "azurerm" {
        resource_group_name  = "mago-iac-dev-eus-rg"
        storage_account_name = "magoiacdeveusac"
        container_name       = "terraform"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
    features{
    }

    subscription_id = var.subscription_id
}