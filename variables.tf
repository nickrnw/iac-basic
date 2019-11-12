variable "region" {
  default = "us-west-2"
}

variable "ami_id" {
    default = "ami-04b762b4289fba92b"
}

variable "ami_key_pair_name" {
  default = "uno-keypair"
}

variable "instace_type" {
  default = "t2.micro"
}