[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/public_ip_address)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=0)
# Deploys a public IP address
Creates an Azure public IP address (IPv4 or IPv6)

Reference the module to a specific version (recommended):
```hcl
module "public_ip_address" {
    source  = "aztfmod/caf-public-ip/azurerm"
    version = "0.x.y"

    name                              = var.name
    location                          = var.location
    rg                                = var.rg
    ip_addr                           = var.ipconfig
    diagnostics_settings              = var.ipdiags
    diagnostics_map                   = var.diagsmap
    la_workspace_id                   = var.laworkspace.id
}
```

## Inputs 

| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| name | string | None | Name of the public IP to be created |
| rg | string | None | Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| location | string | None | Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  | 
| tags | map | None | Map of tags for the deployment.  | 
| log_analytics_workspace_id | string | None | Log Analytics Workspace ID. | 
| diagnostics_map | map | None | Map with the diagnostics repository information.  | 
| diagnostics_settings | object | None | Map with the diagnostics settings. See the required structure in the following example or in the diagnostics module documentation. | 
| convention | string | None | Naming convention to be used (check at the naming convention module for possible values).  | 
| prefix | string | None | Prefix to be used (to be deprecated). | 
| ip_addr | object | None | Object with the settings for public IP deployment.  | 

## Parameters

## ip_addr
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
Example
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

## Outputs

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created IP. |
| name | string | Returns the name of the created Azure Firewall. |
| id | string | Returns the ID of the created Azure Firewall. | 
| ip_address | string | IP address |
| fqdn | string | FQDN of the IP address if applicable |