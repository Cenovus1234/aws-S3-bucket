provider "aws" {
        region = "us-east-2"
 }

   resource "aws_instance" "mtanweer" {
        ami = "ami-916f59f4"
        instance_type = "t2.micro"
        key_name = "Devops_key"
        security_groups= ["tan-sec"]
        #group ID= sg-2979f442
        tags {
         Name = "terraform-instance-sunila"
        }}
   resource "aws_s3_bucket" "mtanweer" {
        bucket= "myaws-s3-bucket-sunila"
        acl= "private"
 }


provider "aws"
{
        region = "us-west-2"
}

#creating VPC
resource "aws_vpc" "mtanweer"
{
        cidr_block = "190.160.0.0/16"
        instance_tenancy = "default"

        tags {
                Name = "aws_vpc"
                Locatio = "Bangalore"
        }
}

#Creating subnet

resource "aws_subnet" "mtanweer"
{
        vpc_id = "$(aws_vpc.mtanweer.id)"
        cidr_block = "190.160.0.0/24"

        tags {
                Name = "my_First_Subnet"
        }
}

