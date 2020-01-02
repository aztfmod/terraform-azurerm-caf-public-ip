module "caf_name_gen" {
  source = "github.com/aztfmod/terraform-azurerm-caf-naming.git?ref=proto"
  
  name    = var.name
  type    = "gen"
  convention  = var.convention
}

resource "azurerm_public_ip" "public_ip" {
  name                      = module.caf_name_gen.gen
  location                  = var.location
  resource_group_name       = var.rg
  allocation_method         = var.ip_addr.allocation_method
  tags                      = local.tags

  sku                       = lookup(var.ip_addr, "sku", null)
  ip_version                = lookup(var.ip_addr, "ip_version", null)   
  domain_name_label         = lookup(var.ip_addr, "dns_prefix", null) 
  idle_timeout_in_minutes   = lookup(var.ip_addr, "timeout", null) 
  zones                     = lookup(var.ip_addr, "zones", null) 
  reverse_fqdn              = lookup(var.ip_addr, "reverse_fqdn", null)
  public_ip_prefix_id       = lookup(var.ip_addr, "public_ip_prefix_id", null)
}