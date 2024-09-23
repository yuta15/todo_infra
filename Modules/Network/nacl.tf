resource "aws_network_acl" "this" {
    depends_on = [ aws_subnet.this ]
    for_each = {for nacl in var.nacl_data: nacl.role => nacl}
    vpc_id = aws_vpc.this.id
 
    dynamic "ingress" {
        for_each = [for ingress in each.value.ingress: ingress]
        content {
            rule_no = ingress.value[0]
            protocol = ingress.value[1]
            cidr_block  = ingress.value[2]
            from_port = ingress.value[3]
            to_port = ingress.value[4]
            action = ingress.value[5]
        }
    }

    dynamic "egress" {
        for_each = [for egress in each.value.egress: egress]
        content {
            rule_no = egress.value[0]
            protocol = egress.value[1]
            cidr_block  = egress.value[2]
            from_port = egress.value[3]
            to_port = egress.value[4]
            action = egress.value[5]
        }
        
    }

    subnet_ids = [for cidr in local.subnet_each_role[each.key]: aws_subnet.this[cidr].id]

    tags = {
      Name = join("-", [each.key, "nacl"])
    }
}