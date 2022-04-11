provider "aws" {
  region = "us-east-1"
}
# group definition.

# Creating group administrators

resource "aws_iam_group" "administrators" {
  name = "administrators2"
}

resource "aws_iam_policy_attachment" "administrators-attach" {
  name       = "administrators-attach"
  groups     = ["${aws_iam_group.administrators.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# create users
resource "aws_iam_user" "admin1" {
  name = "admin1A"
}
resource "aws_iam_user" "admin2" {
  name = "admin2A"
}

# add users to a group :)

resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  users = [
    "${aws_iam_user.admin1.name}",
    "${aws_iam_user.admin2.name}",
  ]
  group = aws_iam_group.administrators.name
}
