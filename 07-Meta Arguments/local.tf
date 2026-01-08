locals {
  common_tags = {
    environment = var.environment
    lob         = "banking"
    stage       = "alpha"
    managed_by  = "terraform"
  }
  merged_tags = merge(local.common_tags, var.resource_tags)
}
