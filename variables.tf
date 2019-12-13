variable "prefix" {
  
}

variable "tags" {
  
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group in which the NIC is deployed. Changing this forces a new resource to be created."
}

variable "location" {
  description = "(Required) Specifies the Azure Region where the NIC is deployed. Changing this forces a new resource to be created."
}

variable "pip_objects" {

}
