resource "aws_route_table" "sigma_public_route_table" {
  vpc_id = aws_vpc.sigma.id

  route {
    cidr_block = var.public_route
    gateway_id = aws_internet_gateway.sigma_igw.id
  }
  tags = {
    Name = "public"
  }
}
resource "aws_route_table" "sigma_private_route_table" {
  vpc_id = aws_vpc.sigma.id

  route {
    cidr_block = var.private_route
    nat_gateway_id = aws_nat_gateway.sigma_nat.id
  }
  tags = {
    Name = "sigma_private-01-route"
  }
}
