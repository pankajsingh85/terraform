module "resourceGrp" {
  source                  = "./modules/resource-grp"
  resource_group_name     = var.resource_grp_name
  resource_group_location = var.resource_grp_location
}

module "vnet" {
  source="./modules/vnet"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.resourceGrp
  ]
}


module "appGtwy"{
  source = "./modules/app-gateway"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.vnet
  ]
}

module "appServiceFE" {
  source                  = "./modules/app-service-fe"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.appGtwy
  ]
}

module "appServiceBE" {
  source                  = "./modules/app-service-be"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.appServiceFE
  ]
}

module "iaasDB"{
  source = "./modules/iaas-db"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.appServiceBE
  ]
}

module "diagonsticSetting"{
  source = "./modules/diagonstic-settings"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output
  depends_on = [
    module.iaasDB
  ]

}


module "keyvault"{
  source="./modules/key-vault"
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output

  depends_on = [
    module.diagonsticSetting
  ]

}

module "agentVM" {
  source = "./modules/agent-vm"
  
  resource_group_name     = module.resourceGrp.resource-grp-name-output
  resource_group_location = module.resourceGrp.resource-grp-location-output

  depends_on = [
    module.keyvault
  ]
  
}




