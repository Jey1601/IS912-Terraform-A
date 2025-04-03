resource "azurerm_storage_account" "samedia" {
    name =  "${lower(var.project_name)}${lower(var.environment)}samedia"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = var.tags
  
}

resource "azurerm_storage_container" "container" {
  name                  = "media"
  storage_account_id    = azurerm_storage_account.samedia.id
  container_access_type = "private"

}

resource "azurerm_storage_account" "saqueue" {
    name =  "${lower(var.project_name)}${lower(var.environment)}saqueue"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = var.tags
  
}

resource "azurerm_storage_queue" "queue" {
  name                 = "procesosasincronos"
  storage_account_name = azurerm_storage_account.saqueue.name
}



