locals {
    az = var.az
    subnet_keys = ["role", "az", "cidr"]
    role_cidrs = [for role in var.subnet_roles: cidrsubnet(var.vpc_cidr, 3, index(var.subnet_roles, role))]
    subnet_cidrs_base = [for cidr in local.role_cidrs: [for az in local.az: cidrsubnet(cidr, 5, index(local.az, az))]]
    subnet_each_role = {for role in var.subnet_roles: role => local.subnet_cidrs_base[index(var.subnet_roles, role)]}
    subnet_cidrs = flatten(local.subnet_cidrs_base)
    subnet_base = setproduct(var.subnet_roles, var.az)
    subnets_data_list = [for cidr in local.subnet_cidrs: concat(local.subnet_base[index(local.subnet_cidrs, cidr)], [cidr])]
    subnets = [for subnet_data in local.subnets_data_list: zipmap(local.subnet_keys, subnet_data)]
    public_subnets = [for subnet in local.subnets: merge(subnet, {"is_public"=true }) if subnet.role == var.public_subnet_role]
    private_subnets = [for subnet in local.subnets: merge(subnet, {"is_public"=false}) if subnet.role != var.public_subnet_role]
}


