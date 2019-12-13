output "id_by_key" {
    depends_on = [azurerm_public_ip.pip]

    value = {
        for key in keys(azurerm_public_ip.pip):
        key => azurerm_public_ip.pip[key].id
    }
}

output "fqdn_by_key" {
    depends_on = [azurerm_public_ip.pip]
    
    value = {
        for key in keys(azurerm_public_ip.pip):
        key => azurerm_public_ip.pip[key].fqdn
    }
}