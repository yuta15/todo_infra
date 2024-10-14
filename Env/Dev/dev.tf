terraform {
    required_version = "1.9.5"
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.68.0"
        }
    }
}


provider "aws" {
    region = local.region
    default_tags {
        tags = local.default_tags
    }
}


module "network" {
    source = "../../Modules/Network"
    vpc_cidr = var.vpc_cidr
    vpc_name = var.vpc_name
    subnet_roles = var.subnet_roles
    az = local.az
    public_subnet_role = local.public_subnet_role
    nacl_data = local.nacl_data
}


module "todo_ecs" {
    source = "../../Modules/ECS"
    
}