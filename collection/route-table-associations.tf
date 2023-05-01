resource "aws_route_table_association" "sigma_public_subnet_a_association" {
  route_table_id = aws_route_table.sigma_public_route_table.id
  subnet_id = aws_subnet.sigma_public_subnet_a.id
}

resource "aws_route_table_association" "sigma_public_subnet_b_association" {
  route_table_id = aws_route_table.sigma_public_route_table.id
  subnet_id = aws_subnet.sigma_public_subnet_b.id
}

resource "aws_route_table_association" "sigma_private_subnet_a_association" {
  route_table_id = aws_route_table.sigma_private_route_table.id
  subnet_id = aws_subnet.sigma_private_subnet_a.id
}

resource "aws_route_table_association" "sigma_private_subnet_b_association" {
  route_table_id = aws_route_table.sigma_private_route_table.id
  subnet_id = aws_subnet.sigma_private_subnet_b.id
}
