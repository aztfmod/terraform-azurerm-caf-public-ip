locals {
    convention = "random"
    name = "caftest"
    location = "southeastasia"
    prefix = ""
    resource_groups = {
        test = { 
            name     = "test-caf"
            location = "southeastasia" 
        },
    }
    tags = {
        environment     = "DEV"
        owner           = "CAF"
    }
    solution_plan_map = {
        NetworkMonitoring = {
            "publisher" = "Microsoft"
            "product"   = "OMSGallery/NetworkMonitoring"
        },
    }
    
    ip_addr_config = {
        ip_name = "arnaud-pip-egress"    
        allocation_method   = "Static"
        #Dynamic Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure 
        
        #properties below are optional 
        sku                 = "Standard"                        #defaults to Basic
        ip_version          = "IPv4"                            #defaults to IP4, Only dynamic for IPv6, Supported arguments are IPv4 or IPv6, NOT Both

        diagnostics = {
            log = [
                        #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                        ["DDoSProtectionNotifications", true, true, 30],
                        ["DDoSMitigationFlowLogs", true, true, 30],
                        ["DDoSMitigationReports", true, true, 30],
                ]
            metric = [
                    ["AllMetrics", true, true, 30],
            ]
        }
    }
}