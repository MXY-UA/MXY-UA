Skip to content
Why GitHub? 
Team
Enterprise
Explore 
Marketplace
Pricing 
Search
Sign in
Sign up
zaval13
/
Wordpress-on-AWS-Terraform-Ansible-
00
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Wordpress-on-AWS-Terraform-Ansible-/terraform/aws.tf

Valentyn Zakharov files added
Latest commit 6d9c4b0 on Jul 14
 History
 0 contributors
57 lines (47 sloc)  1.05 KB
  
provider "aws" {
region = "us-east-2"
}

resource "aws_instance" "my_aws" {
  ami = "ami-0233c2d874b811deb"
  instance_type = "t2.micro"
  key_name         = "awskey"
  vpc_security_group_ids = [aws_security_group.my_webserver1.id]
    
  tags = {
      Name = "Wordpress1"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.my_aws.id
  vpc = true
}

resource "aws_security_group" "my_webserver1" {
  name        = "webserver security group1"
  description = "security group"
  
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  

  tags = {
    Name = "security group"
  }
}
