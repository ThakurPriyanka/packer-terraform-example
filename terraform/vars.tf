variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "region" { 
	default="us-east-1"
}

variable  "image_name" {
	default = "ami_image_name"
}

variable "PATH_TO_PRIVATE_KEY" {
	default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
	default= "mykey.pub"
}

variable "INSTANCE_USERNAME" {
	default = "ubuntu"
}
