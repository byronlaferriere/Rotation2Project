locals {
  topic_name = length(var.name) > 0 ? var.name : "${var.department}-${var.application}-${var.environment}-${var.name_suffix}"
}