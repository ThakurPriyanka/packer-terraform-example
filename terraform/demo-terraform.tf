data "aws_ami" "ubuntu" {
  most_recent      = true
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners     = [981997154569]
}

resource "aws_key_pair" "mykey" {
	key_name = "mykey"
	public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "bootstrap" {
  ami          = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}" 
  count = "1"
provisioner "file" {
    source      = "program/hello-world.sh"
    destination = "/tmp/hello-world.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/hello-world.sh",
      "/tmp/hello-world.sh",
    ]
  }

connection {
	user = "${var.INSTANCE_USERNAME}"
	private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
}
}

output "ip" {
value = "${aws_instance.bootstrap.ami}" 
}

output "name" {
value = "${var.image_name}" 
}

