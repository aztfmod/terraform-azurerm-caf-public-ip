[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys a public IP address
Creates an Azure public IP address (IPv4 or IPv6)

Reference the module to a specific version (recommended):
```hcl
module "public_ip_address" {
  source  = "aztfmod/caf-public-ip/azurerm"
  version = "0.x.y"

  convention                       = local.convention
  name                             = local.ip_addr_config.ip_name
  location                         = local.location
  resource_group_name              = azurerm_resource_group.rg_test.name
  ip_addr                          = local.ip_addr_config
  tags                             = local.tags
  diagnostics_map                  = module.diags_test.diagnostics_map
  log_analytics_workspace_id       = module.la_test.id
  diagnostics_settings             = local.ip_addr_config.diagnostics
}
```

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->

## Parameters

### ip_addr
(Required) The configuration object describing the public IP configuration
Mandatory properties are:
- allocation_method

Optional properties are:
- sku
- ip_version
- dns_prefix
- timeout
- zones
- public_ip_prefix_id

```hcl
variable "ip_addr" {
 description = "(Required) Map with the settings for public IP deployment"
}
```
Example:

```hcl
  ip_addr = {
        allocation_method   = "Static"
        #Dynamic Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure 
        
        #properties below are optional 
        sku                 = "Standard"                        #defaults to Basic
        ip_version          = "IPv4"                            #defaults to IP4, Only dynamic for IPv6, Supported arguments are IPv4 or IPv6, NOT Both
        dns_prefix          = "arnaudmytestdeeee" 
        timeout             = 15                                #TCP timeout for idle connections. The value can be set between 4 and 30 minutes.
        zones               = [1]                               #1 zone number, IP address must be standard, ZoneRedundant argument is not supported in provider at time of writing
        #reverse_fqdn        = ""   
        #public_ip_prefix_id = "/subscriptions/00000000-00000-0000-0000-000000000000/resourceGroups/uqvh-hub-ingress-net/providers/Microsoft.Network/publicIPPrefixes/myprefix"
        #refer to the prefix and check sku types are same in IP and prefix 
  }
```