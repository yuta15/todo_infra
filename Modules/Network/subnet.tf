resource "aws_subnet" "this" {
    depends_on = [ aws_vpc.this ]
    for_each = {for subnet in local.subnets: subnet.cidr => subnet}
    vpc_id = aws_vpc.this.id
    cidr_block = each.key
    availability_zone = each.value.az
    tags = {
        Name = join("-", [each.value.role, split("-", each.value.az)[2]])
    }
}