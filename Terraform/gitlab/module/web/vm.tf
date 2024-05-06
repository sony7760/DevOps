terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = "ubuntu-ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC2S0HhpB7nOtlMnBozTjBfhZEcMFV/lrQJ3E7c/ay0qK08uUARNCWAgO7G5yBxnwDU7SuQGJucxzPPO5bLiytqu9mOQ2BdqBriTf9iTyPKy5LE7cr7M3nipOExpRpnHewP8pXZHk+sQSqqGGfYqdl/j8Wpm1zzpchqdpq1368r1O5x9u3vt1Huh84bWgVQ4ichEREIAeeQt1M/fa6zWrWNQHSw5cvpiPzw1ohL3SdhFj6AhxpIB0+7CaYVtRxFGCGsd1CmkNDpYFgoN8oRIPwrGz1gBIvRG4z3x+dutMEHhJ11jOezMQ9JuCmW6vc7BPKElYg1KYx4LLr7ku8pYSPmls+gu5gD9JetpTieLZfbTtNIe6MKITUHbAYa3LxRKXHvAefIHjjDmhnOjKoNpYO9djYRwZUQ6gYLjoIC4dy661yIv7MDF3bXdwoRQvOLerb/h53zuwxK02eQcXd/MlLoMgBNCJLGCatNG6tc/l7LI9KXaYpb74Qm3ZTtL9tilgM= nov2023"
}

resource "aws_security_group" "ssh-sg" {
  name = "ssh-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  count = 1
  key_name = "ubuntu-ssh-key"
  vpc_security_group_ids = [aws_security_group.ssh-sg.id]

  tags = {
    Name = "app_server"
  }
  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "sudo apt install nginx -y", "echo Done!"]
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' apache-install.yml"
  }
}
