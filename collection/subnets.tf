resource "aws_subnet" "sigma_public_subnet_a" {
  depends_on = [
    aws_vpc.sigma
  ]  
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.public_subnets_cidr[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "SigmaVpcPublicSubnet1a"
  }
}

#--------------------------------------------------------------------------

resource "aws_subnet" "sigma_public_subnet_b" {
  depends_on = [
    aws_vpc.sigma
  ]
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.public_subnets_cidr[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "SigmaVpcPublicSubnet1b"
  }
}

#--------------------------------------------------------------------------

resource "aws_subnet" "sigma_private_subnet_a" {
  depends_on = [
    aws_vpc.sigma
  ]
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.private_subnets_cidr[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "SigmaVpcPrivateSubnet1a"
  }
}

#--------------------------------------------------------------------------

resource "aws_subnet" "sigma_private_subnet_b" {
  depends_on = [
    aws_vpc.sigma
  ]  
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.private_subnets_cidr[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "SigmaVpcPrivateSubnet1b"
  }
}

# ---------------------------------------------------------------------------

resource "aws_subnet" "sigma-eks-db-subnet-a" {
  depends_on = [
    aws_vpc.sigma
  ]
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.db_subnets_cidr[0]
  availability_zone = var.availability_zones[0]
  tags = {
    "Name" = "sigma-eks-db-subnet-a"
  }
}

# ---------------------------------------------------------------------------

resource "aws_subnet" "sigma-eks-db-subnet-b" {
  depends_on = [
    aws_vpc.sigma
  ]
  vpc_id = aws_vpc.sigma.id
  cidr_block = var.db_subnets_cidr[1]
  availability_zone = var.availability_zones[1]
  tags = {
    "Name" = "sigma-eks-db-subnet-b"
  }
}

