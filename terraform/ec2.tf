# Web servers

resource "aws_instance" "web" {
    count = 3
    ami = "${var.ubuntu-ami}"
    instance_type = "${var.web-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.eclipse.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

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
    vpc_security_group_ids = ["${aws_security_group.eclipse.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "db${count.index}"
        group = "eclipse-ec2"
    }
}

# Load balancers

resource "aws_instance" "lb" {
    count = 2
    ami = "${var.rhel-ami}"
    instance_type = "${var.lb-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.eclipse.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "lb${count.index}"
        group = "eclipse-ec2"
    }
}

# Logging server

resource "aws_instance" "log" {
    ami = "${var.rhel-ami}"
    instance_type = "${var.log-instance-type}"
    subnet_id = "${aws_subnet.public.id}"
    vpc_security_group_ids = ["${aws_security_group.eclipse.id}", "${aws_security_group.internal.id}"]
    key_name = "${aws_key_pair.eclipse.key_name}"

    user_data = "${data.template_file.user_data.rendered}"

    tags = {
        Name = "log"
        group = "eclipse-ec2"
    }
}
