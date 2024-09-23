output "vpc" {
    description = "VPC情報のアウトプット"
    depends_on = [ aws_vpc.this ]
    value = aws_vpc.this
}


output "subnets" {
    description = "サブネット情報のアウトプット"
    depends_on = [ aws_subnet.this ]
    value = aws_subnet.this
}


output "igw" {
    description = "IGWの情報のアウトプット"
    depends_on = [ aws_internet_gateway.this ]
    value = aws_internet_gateway.this
}


output "ngw" {
    description = "Nat gatewayの情報のアウトプット"
    depends_on = [ aws_nat_gateway.this ]
    value = aws_nat_gateway.this
}


output "route_table_public" {
    description = "publicルートテーブルの情報"
    depends_on = [ aws_route_table.public ]
    value = aws_route_table.public
}


output "route_table_private" {
    description = "privateルートテーブルの情報"
    depends_on = [ aws_route_table.private ]
    value = aws_route_table.private
}


output "nacl" {
    description = "NACLの情報のアウトプット"
    depends_on = [ aws_network_acl.this ]
    value = aws_network_acl.this
  
}