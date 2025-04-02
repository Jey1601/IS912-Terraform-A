resource "azurerm_storage_account" "samedia" {
    name =  "${lower(var.project_name)}${lower(var.repository_name)}samedia"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = var.tags
  
}


resource "azurerm_storage_account" "samessages" {
    name =  "${lower(var.project_name)}${lower(var.repository_name)}samessages"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = var.tags
  
}




