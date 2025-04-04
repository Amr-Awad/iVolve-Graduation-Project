locals {
  public_instance_ids  = flatten([for instance in module.ec2_create_public_instances : instance.instance_ids])
  public_instance_ips = flatten([for instance in module.ec2_create_public_instances : instance.instance_ips])
}

# Create public instances
module "ec2_create_public_instances" {
  for_each            = { for idx, subnet_id in module.vpc-create.public_subnet_ids : idx => subnet_id }
  source              = "./modules/ec2-module"
  subnet-id           = each.value
  instance-type       = each.key == "0" ? "t3.large" : "t3.medium"
  ssh-key             = module.ssh-key-create.ssh-key
  sg-id               = module.public-security-group.sg-id
  is-public           = true
  linux-type          = "ubuntu"
  instance-name       = each.key == "0" ? "master" : "slave"
}