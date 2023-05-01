resource "aws_eip" "sigma_nat" {
  vpc = true
  tags = {
    Name = "lga-eks-sigma-nat-eip"
  }
}