module "public-security-group" {
  source = "./modules/security-groups-module"
  sg-name = "public-sg"
  sg-description = "Security group for public subnet"
  vpc-id = module.vpc-create.vpc-id
  ssh-make = true
  http-make = true
  https-make = true
  jenkins-make = true
  sonarqube-make = true
}