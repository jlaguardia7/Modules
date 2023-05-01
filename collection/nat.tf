resource "aws_nat_gateway" "sigma_nat" {
  depends_on = [
    aws_vpc.sigma,
    aws_subnet.sigma_public_subnet_a,
    aws_eip.sigma_nat
  ]
  allocation_id = aws_eip.sigma_nat.id  
  subnet_id = aws_subnet.sigma_public_subnet_a.id
  tags = {
    Name = "lga-eks-sigma-nat"
  }
}
