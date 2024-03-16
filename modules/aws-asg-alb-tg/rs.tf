resource "random_string" "random" {
  count = local.workspace
  length           = 16
  special          = true
  override_special = "/@£$"
}