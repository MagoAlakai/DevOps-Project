resource "azurerm_mssql_server" "sql-server" {
    location = var.location2
    name = "mago-devops-${var.env_id}-eus-sqlserver-main"
    resource_group_name = azurerm_resource_group.my-mago-devops-dev-eus-rg.name
    version = "12.0"
    administrator_login = "sqladminuser"
    administrator_login_password = var.sql_pass
    
    tags = {
        enviroment = var.env_id
        src = var.src
    }
}

resource "azurerm_mssql_database" "db" {
    name = "mago-devops-${var.env_id}-eus-db"
    server_id = azurerm_mssql_server.sql-server.id
    collation = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb = 10
    sku_name = "S1"
    zone_redundant = false

    lifecycle{
        prevent_destroy = false
    }
    
    tags = {
        enviroment = var.env_id
        src = var.src
    }
}

resource azurerm_mssql_firewall_rule "sql-rule" {
    name = "mago-devops-${var.env_id}-eus-sqlserver-rule"
    server_id = azurerm_mssql_server.sql-server.id
    start_ip_address = "0.0.0.0"
    end_ip_address = "0.0.0.0"
}  