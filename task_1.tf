provider "aws" {
     region=  "ap-south-1"
}

 resource "tls_private_key" "this" {
         algorithm = "RSA"
   }

module "key_pair" {
       source = "terraform-aws-modules/key-pair/aws"
       key_name = "dp-key"
public_key = tls_private_key.this.public_key_openssh
}