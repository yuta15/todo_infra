resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.this.id
    }
    
    tags = {
        Name = join("-",["public", "rt"])
    }
}


resource "aws_route_table" "private" {
    depends_on = [ aws_internet_gateway.this, aws_nat_gateway.this ]
    for_each = {for subnet in local.private_subnets: subnet.cidr => subnet}
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.this[each.value.az].id
    }

    tags = {
        Name = join("-", [each.value.role, split("-", each.value.az)[2], "rt"])
    }
}


resource "aws_route_table_association" "public" {
    depends_on = [ aws_route_table.public ]
    for_each = {for subnet in local.public_subnets: subnet.cidr => subnet}
    subnet_id = aws_subnet.this[each.key].id
    route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private" {
    depends_on = [ aws_route_table.private ]
    for_each = {for subnet in local.private_subnets: subnet.cidr => subnet}
    subnet_id = aws_subnet.this[each.key].id
    route_table_id = aws_route_table.private[each.key].id
}


