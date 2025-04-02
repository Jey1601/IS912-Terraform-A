resource "azurerm_mssql_server" "sqlserver" {
    name = "dbserver-${lower(var.project_name)}-${lower(var.repository_name)}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    version = "12.0"
    administrator_login = "sqladmin"
    administrator_login_password = var.admin_sql_password

    tags = var.tags
}


resource "azurerm_mssql_database" "dbsql" {
    name = "dbsql-${lower(var.project_name)}-${lower(var.repository_name)}"
    server_id = azurerm_mssql_server.sqlserver.id
    sku_name = "S0"
    tags = var.tags
    
}


resource "azurerm_cosmosdb_account" "dbnosql" {
    name = "dbnosql-${lower(var.project_name)}-${lower(var.repository_name)}" 
    location = var.location  
    resource_group_name = azurerm_resource_group.rg.name  
    offer_type = "Standard"  
    kind = "GlobalDocumentDB"  
    
    consistency_policy {
        consistency_level = "Session" 
    }

    geo_location {
        location = var.location  
        failover_priority = 0  
    }

    tags = var.tags
}


resource "azurerm_cosmosdb_sql_database" "dbnosql-media" {
  name                = "dbnosql-${lower(var.project_name)}-${lower(var.repository_name)}-media"
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_cosmosdb_account.dbnosql.name
}

resource "azurerm_redis_cache" "cache" {
    name = "cache-${lower(var.project_name)}-${lower(var.repository_name)}"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    family = "C"
    capacity = 0
    sku_name = "Basic"
    non_ssl_port_enabled = false
    minimum_tls_version = "1.2"

    tags = var.tags
  
}