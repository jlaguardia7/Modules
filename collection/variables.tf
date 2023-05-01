variable "vpc_prefix" {
  type    = string
  default = "/721/lga/sigma"
}

variable "common_tags" {
  type = map(any)
  default = {
    "AssetID"       = "721"
    "AssetName"     = "Infrastructure"
    "AssetAreaName" = "LGA"
    "ControlledBy"  = "Terraform"
    "CloudProvider" = "aws"
    "Environment"   = "dev"
    "Project"       = "alpha"
  }
}

variable "aws_region" {
    type    = string
    default = "us-east-1"
}

variable "environment" {
    type    = string
    default = "dev"
}

variable "name" {
    type    = string
    default = "sigma"
}

variable "public_route" {
    type    = string
    default = "0.0.0.0/0"
}

variable "private_route" {
    type    = string
    default = "0.0.0.0/0"
}

variable "public_subnets_cidr" {
    type    = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_subnets_cidr" {
    type    = list(string)
    default = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "db_subnets_cidr" {
    type    = list(string)
    default = ["10.0.5.0/24","10.0.6.0/24"] 
}

variable "availability_zones" {
    type    = list(string) 
    default = ["us-east-1a","us-east-1b"]
}

variable "bastion_instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "terraform-key1"
}

variable "bastion_security_groups" {
  type = list(string)
  default = ["bastion-security-group"]
}

variable "bastion_tags" {
  type = map(string)
  default = {
    Name = "bastion-host"
  }
}