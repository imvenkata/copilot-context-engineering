output "name" {
  description = "Name passed to the module."
  value       = var.name
}

output "tags" {
  description = "Merged tags used by the module."
  value       = local.effective_tags
}
