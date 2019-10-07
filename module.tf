resource "azurerm_public_ip" "public_ip" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.rg
  allocation_method         = var.ip_addr.allocation_method
  tags                      = local.tags

  sku                       = "${contains(keys(var.ip_addr), "sku") ? var.ip_addr.sku : null}"
  ip_version                = "${contains(keys(var.ip_addr), "ip_version") ? var.ip_addr.ip_version : null}"  
  domain_name_label         = "${contains(keys(var.ip_addr), "dns_prefix") ? var.ip_addr.dns_prefix : null}"
  idle_timeout_in_minutes   = "${contains(keys(var.ip_addr), "timeout") ? var.ip_addr.timeout : null}"
  zones                     = "${contains(keys(var.ip_addr), "zones") ? var.ip_addr.zones : null}"
  reverse_fqdn              = "${contains(keys(var.ip_addr), "reverse_fqdn") ? var.ip_addr.reverse_fqdn : null}"
  public_ip_prefix_id       = "${contains(keys(var.ip_addr), "public_ip_prefix_id") ? var.ip_addr.public_ip_prefix_id : null}"
}