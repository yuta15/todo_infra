resource "aws_eip" "this" {
    depends_on = [ aws_vpc.this ]
    for_each = {for public_subnet in local.public_subnets: public_subnet.az => public_subnet}
    domain = "vpc"
}


resource "aws_nat_gateway" "this" {
    depends_on = [ aws_eip.this, aws_subnet.this ]
    for_each = {for public_subnet in local.public_subnets: public_subnet.az => public_subnet}
    allocation_id = aws_eip.this[each.key].id
    subnet_id = aws_subnet.this[each.value.cidr].id
    tags = {
        Name = join("-", [each.value.role, split("-", each.value.az)[2], "ngw"])
    }
}