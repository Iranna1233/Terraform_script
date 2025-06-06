provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "Demo" {
  ami       = "ami-0e35ddab05955cf57"
  instance_type = "t2.medium"
  tags = {
    Name = "Demo"
  }
}
