provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "%userprofile%/.aws/credentials" // Default Windows Location For AWS Credentials
  profile                 = "terraform"
}

resource "aws_instance" "web" {
  ami = "ami-04b762b4289fba92b" // US West Oregon | Amazon EC2 x64
  instance_type = "${var.instace_type}"
  get_password_data = "true"
  key_name = "${var.ami_key_pair_name}"

  tags = {
    Name = "terraformed"
  }
  // Delete Storage on instance termination
  root_block_device {
    delete_on_termination = "true"
  }
}