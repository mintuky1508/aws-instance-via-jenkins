provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-005fc0f236362e99f"  # Choose an appropriate AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }

  key_name = "cicd.pem"  # Ensure this key pair is in the same region
}

output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
