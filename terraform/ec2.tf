# Web servers

resource "aws_instance" "web" {
    count = 3
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.web-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["pass"]
    key_name = "pass"

    user_data = "pass"

    tags = {
        Name = "wb${count.index}"
        group = "eclipse-ec2"
    }
}
