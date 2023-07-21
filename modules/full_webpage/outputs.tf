output "webpage" {
    value = {
        environment = local.environment
        application = local.application
        host_name = azurerm_static_site.static_app.default_host_name
        api_key = nonsensitive(azurerm_static_site.static_app.api_key)
    }
}