variable "location" {
  description = "Location of all resources"
  type = string
}

variable "rg_name" {
  description = "Resource group name"
  type = string
}

variable "address_space" {
  description = "Address space of the vnet"
  type = list(string)
}

variable "tags" {
  description = "Tags to use on all resource"
  type = map(string)
}