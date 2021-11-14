
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {

  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
}