resource "azurerm_resource_group" "my-mago-devops-dev-eus-rg" {
    location = var.location
    name = "mago-devops-dev-eus-rg"

    tags = {
        enviroment = var.env_id
        src = var.src
    }
}