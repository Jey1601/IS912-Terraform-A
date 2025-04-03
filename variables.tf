variable "subscription_id" {
    description = "The ID of the Azure subscription"
    type        = string
}

variable "tags" {
    description = "Tags to be applied to all resources"
    type        = map(string)
    default     =  {
        repository = "A"
        date        = "2025-04-01"
        created_by  = "Terraform"
    }
}

variable "location" {
    description = "The Azure region to deploy resources in"
    type        = string
    default     = "Central US"
}

variable "project_name" {
    description = "The name of the project"
    type        = string
    default     = "ecommerce"
  
}

variable "environment" {
    description = "The name of the repository"
    type        = string
    default     = "dev"
  
}

variable "admin_sql_password" {
    type = string
    description = "The password for the SQL Server administrator login"
}