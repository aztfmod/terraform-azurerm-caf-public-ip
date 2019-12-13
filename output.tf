output "object" {
  description = "Output the full object"
  value = azurerm_public_ip.public_ip
}

output "ip_address" {
  description = "Output the ip address"
  value = azurerm_public_ip.public_ip.ip_address
}

output "fqdn" {
  description = "Output the fully qualified domain name"
  value = azurerm_public_ip.public_ip.fqdn
}

output "name" {
  description = "Output the object name"
  value = azurerm_public_ip.public_ip.name
}

output "id" {
  description = "Output the object ID"
  value = azurerm_public_ip.public_ip.id
}
