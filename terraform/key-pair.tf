resource "aws_key_pair" "eclipse" {
    key_name = "eclipse-key"
    public_key = "${file("ssh/eclipse-key.pub")}"
}
