module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  cidr                   = "10.0.0.0/16"
  create_igw             = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  name                   = "eks-vpc"

  azs                 = ["${var.region}a", "${var.region}b"]
  public_subnets      = var.public_subnets_cidr_blocks
  public_subnet_names = var.public_subnets_names

  private_subnets      = var.private_subnets_cidr_blocks
  private_subnet_names = var.private_subnets_names
}