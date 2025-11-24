resource "azurerm_log_analytics_workspace" "my-mago-devops-dev-eus-law" {
    location = azurerm_resource_group.my-mago-devops-dev-eus-rg.location
    name = "mago-devops-${var.env_id}-eus-law" 
    resource_group_name = azurerm_resource_group.my-mago-devops-dev-eus-rg.name
    sku = "PerGB2018"
    retention_in_days = 30
}