resource "aws_internet_gateway" "sigma_igw" {
  depends_on = [
    aws_vpc.sigma
  ]
  vpc_id = aws_vpc.sigma.id
    tags = {
    Name = "lga-eks-sigma-internet-gateway"
  }
}