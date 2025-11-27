resource "azurerm_container_app_environment" "my-mago-devops-dev-eus-acae" {
    location = azurerm_resource_group.my-mago-devops-dev-eus-rg.location
    name = "mago-devops-${var.env_id}-eus-acae"
    resource_group_name = azurerm_resource_group.my-mago-devops-dev-eus-rg.name
    log_analytics_workspace_id = azurerm_log_analytics_workspace.my-mago-devops-dev-eus-law.id

    tags = {
        enviroment = var.env_id
        src = var.src
    }
}