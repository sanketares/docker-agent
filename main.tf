provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sanket_in1111s" {
  instance_type = "t2.micro"
  ami           = "ami-0e86e20dae9224db8"
  tags = {
    Name = "sanket54321"
  }
}
resource "aws_instance" "sanket_inssed" {
  instance_type = "t2.micro"
  ami           = "ami-0e86e20dae9224db8"
  tags = {
    Name = "sanket12345"
  }
}
resource "aws_instance" "sanket_inssedggggggggggggggggggggg" {
  instance_type = "t2.micro"
  ami           = "ami-0e86e20dae9224db8"
  tags = {
    Name = "sanket12345ddddddddddddd"
  }
}
