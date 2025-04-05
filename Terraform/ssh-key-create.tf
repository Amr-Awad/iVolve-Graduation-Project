module "ssh-key-create" {
    source = "./modules/ssh-key-module"
    key-name = "jenkins-key"
}