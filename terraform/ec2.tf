# Web ervers

resource "aws_instance" "web" {
    count = 3
    ami = ""
    instance_type = ""
    subnet_id = ""
    vpc_security_group_ids = [""]
    key_name = ""

    user_date = ""

    tags = {
        Name = "wb${count.index}"
        group = "eclipse-ec2"
    }
}
