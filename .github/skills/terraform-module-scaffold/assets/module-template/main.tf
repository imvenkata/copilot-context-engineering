locals {
  effective_tags = merge(var.tags, {
    module = var.name
  })
}
