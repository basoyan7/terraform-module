locals {
 instance_type = "${terraform.workspace == "dev" ? "t2.micro" : "t3.micro"}"
 max_size = "${terraform.workspace == "dev" ? 1 : 5}"
 min_size = "${terraform.workspace == "dev" ? 1 : 2}"
 desired_capacity = "${terraform.workspace == "dev" ? 1 : 2}"
 workspace = "${terraform.workspace == "dev" ? 1 : 0}"
}