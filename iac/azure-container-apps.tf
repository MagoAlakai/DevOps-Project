resource "azurerm_container_app" "app" {
    name = "mago-devops-${var.env_id}-eus-app"
    resource_group_name = azurerm_resource_group.my-mago-devops-dev-eus-rg.name
    container_app_environment_id = azurerm_container_app_environment.my-mago-devops-dev-eus-acae.id
    revision_mode = "Multiple"

    template {
        min_replicas = 1
        max_replicas = 3
        container {
            name = "my-mago-devops-dev-eus-container"
            image = "mcr.microsoft.com/k8se/quickstart:latest"
            cpu = 0.25
            memory = "0.5Gi"
        }
    }

    ingress {
        allow_insecure_connections = false
        external_enabled = true
        target_port = 8080
        traffic_weight {
            label = "primary"
            percentage = 100
            latest_revision = true
        }
    }

    tags = {
        enviroment = var.env_id
        src = var.src
    }
}