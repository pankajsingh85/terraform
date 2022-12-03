variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "resource_group_location" {
  description = "location of the resource group to be imported."
  type        = string
}
variable "vnet-name" {
  type        = string
  description = "The name of vnet"
  default =  "vnet"
}

variable "address_space" {
  type        = string
  description = "The CIDR of the network VNET"
  default = "10.0.0.0/16"
}

variable "pools"{
  description = "Map of pools to configuration."
  type=map(any)
  default={
    pool_1={
      subnet_name="front",
      address_prefixes=["10.0.1.0/24"]
    },
    pool_2={
      subnet_name="back",
      address_prefixes=["10.0.2.0/24"]
    }

  }
}


variable "subnets"{
  description = "Map of pools to configuration."
  type=map(any)
  default={
    pool_1={
      subnet_name="db",
      address_prefixes=["10.0.3.0/24"]
    },
    pool_2={
      subnet_name="appgtwy",
      address_prefixes=["10.0.4.0/24"]
    },
    pool_3={
      subnet_name="agent-vm",
      address_prefixes=["10.0.5.0/24"]
    }
  }
}
