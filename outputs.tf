output "web_pages" {
  value = concat(values(module.webpage_azure_pipelines)[*].webpage,
  values(module.webpage_angular_standalone_actions)[*].webpage)
}

# output "rg_location" {
#     value = azurerm_resource_group.rg.location
#     description = "Location of the create resource group"
# }

# Just for testing
# output "iterations_next" {
#     value = [for it in var.iterations : it + 2]
# }

# output "app_standalone_key" {
#     value = values(azurerm_static_site.static_app)[*].api_key
#     sensitive = true
# }

# output "app_standalone_host" {
#     value = values(azurerm_static_site.static_app)[*].default_host_name
# }

# output "app_standalone_key_2" {
#     value = [for ak in values(azurerm_static_site.static_app).*.api_key : nonsensitive(ak) ]
# }