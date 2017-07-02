# Web servers

resource "aws_instance" "web" {
    count = 3
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.web-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["pass"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "pass"

    tags = {
        Name = "wb${count.index}"
        group = "eclipse-ec2"
    }
}

# Database servers

resource "aws_instance" "db" {
    count = 3
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.db-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["pass"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "pass"

    tags = {
        Name = "db${count.index}"
        group = "eclipse-ec2"
    }
}
