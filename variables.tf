variable "name" {
  description = "(Required) Name of the public IP to be created"  
}

variable "location" {
  description = "(Required) Location of the public IP to be created"   
}

variable "resource_group_name" {
  description = "(Required) Resource group of the public IP to be created"    
}

variable "tags" {
  description = "(Required) Tags to be applied to the IP address to be created"
  
}

variable "diagnostics_map" {
  description = "(Required) Storage account and Event Hub for the IP address diagnostics"  

}

variable "log_analytics_workspace_id" {
  description = "(Required) Log Analytics ID for the IP address diagnostics"
  
}

variable "diagnostics_settings" {
 description = "(Required) Map with the diagnostics settings for public IP deployment"
}

# diagnostics settings object example for public ip  object
# diagnostics_settings = {
#     log = [
#                 #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
#                 ["DDoSProtectionNotifications", true, true, 30],
#                 ["DDoSMitigationFlowLogs", true, true, 30],
#                 ["DDoSMitigationReports", true, true, 30],
#         ]
#     metric = [
#                ["AllMetrics", true, true, 30],
#     ]
# }

variable "ip_addr" {
 description = "(Required) Object with the settings for public IP deployment"
}

# Example of ip_addr configuration object
# ip_addr = {
#       name                = "pip_test"
#       location            = "southeastasia"
#       rg                  = "uqvh-hub-egress-net"
#       allocation_method   = "Static"
#       #Dynamic Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure 
      
#       #properties below are optional 
#       sku                 = "Standard"                        #defaults to Basic
#       ip_version          = "IPv4"                            #defaults to IP4, Only dynamic for IPv6, Supported arguments are IPv4 or IPv6, NOT Both
#       dns_prefix          = "arnaudmytestdeeee" 
#       timeout             = 15                                #TCP timeout for idle connections. The value can be set between 4 and 30 minutes.
#       zones               = [1]                               #1 zone number, IP address must be standard, ZoneRedundant argument is not supported in provider at time of writing
#       #reverse_fqdn        = ""   
#       #public_ip_prefix_id = "/subscriptions/783438ca-d497-4350-aa36-dc55fb0983ab/resourceGroups/uqvh-hub-ingress-net/providers/Microsoft.Network/publicIPPrefixes/myprefix"
#       #refer to the prefix and check sku types are same in IP and prefix 
# }

variable "convention" {
  description = "(Required) Naming convention method to use"  
}

variable "prefix" {
  description = "(Optional) You can use a prefix to the name of the resource"
  type        = string
  default = ""
}

variable "postfix" {
  description = "(Optional) You can use a postfix to the name of the resource"
  type        = string
  default = ""
}

variable "max_length" {
  description = "(Optional) You can speficy a maximum length to the name of the resource"
  type        = string
  default = ""
}

