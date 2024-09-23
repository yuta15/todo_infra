resource "aws_internet_gateway" "this" {
    depends_on = [ aws_vpc.this ]
    vpc_id = aws_vpc.this.id
    tags = {
        Name = join("-",[var.vpc_name, "igw"])
    }
}