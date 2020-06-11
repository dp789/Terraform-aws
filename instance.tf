

resource "aws_instance" "first-os" {
  ami               = "ami-0447a12f28fddb066"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  security_groups   = ["${aws_security_group.dp-ssh-http.name}"]   
  key_name = "dp-key"
 user_data = <<-EOF
                #! /bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
  EOF
  tags = {
        Name = "newos"
  }

}