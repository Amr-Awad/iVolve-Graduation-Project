module "vpc-create" {
    source = "./modules/vpc-module"
    vpc-name = "block-one-vpc"
    vpc-cidr = "10.0.0.0/16"
    public_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24"]
    azs = ["us-east-1a"]    
}