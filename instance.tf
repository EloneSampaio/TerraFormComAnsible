//variavel com definicao de instancias.
locals {
  multiple_instances = {
    one = {
      instance_type = "t3.micro"
      //availability_zone = element(module.vpc.azs, 0)
      //subnet_id         = element(module.vpc.private_subnets, 0)
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp3"
          throughput  = 200
          volume_size = 50
          tags = {
            Name = "meu volume principal"
          }
        }
      ]
    }
    /* two = {
      instance_type = "t3.small"
      //availability_zone = element(module.vpc.azs, 1)
      //subnet_id         = element(module.vpc.private_subnets, 1)
      root_block_device = [
        {
          encrypted   = true
          volume_type = "gp2"
          volume_size = 50
        }
      ]
    }
    three = {
      instance_type = "t3.medium"
      //availability_zone = element(module.vpc.azs, 2)
      //subnet_id         = element(module.vpc.private_subnets, 2)
    } */
  }
}

resource "aws_key_pair" "ec2loginkey" {
  key_name = "login-key"
  ## change here if you are using different key pair
  public_key = "${file(var.public_key)}"
}
/* 
resource "null_resource" "example1" {

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host = "${module.ec2_instance.private_ip}"
      user        = var.ansible_user
      private_key = "${file(var.private_key)}"
    }
}

} */

/* resource "null_resource" "example2" {

  provisioner "local-exec" {
    
	command = <<EOT
    sleep 30;
	  echo "${module.ec2_instance.public_ip} ansible_user=${var.ansible_user} ansible_ssh_private_key_file=${var.private_key}";
    export ANSIBLE_HOST_KEY_CHECKING=False;
	  ansible-playbook -u ${var.ansible_user} --private-key ${var.private_key} ./ansible/playbook.yml
    EOT
  }
}
 */


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  key_name = "${aws_key_pair.ec2loginkey.key_name}"
  #for_each = local.multiple_instances
  #name     = "${var.instance_name}-server-${each.key}"
  name = "LuaiBase"

  ami           = var.aws_ami
  instance_type = "t2.micro"  #each.value.instance_type
  // key_name      = "user1"
  monitoring = true
  //vpc_security_group_ids = ["sg-12345678"]
  //subnet_id              = "subnet-eddcdzz4"
  vpc_security_group_ids = [module.security_group.security_group_id]
  enable_volume_tags     = false
  #root_block_device      = lookup(each.value, "root_block_device", [])
  tags                   = local.tags
}

resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tmpl", {
      ip          = module.ec2_instance.public_ip,
      ssh_keyfile = var.private_key
  })
  filename = format("%s/%s", abspath(path.root), "inventory.yaml")
}