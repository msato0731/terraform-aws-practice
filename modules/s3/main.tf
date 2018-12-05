resource "aws_s3_bucket" "terraform-state-storage" {
  bucket = "${var.name}"
  acl = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
  }
}
