resource "aws_sqs_queue" "sqs_queue" {
  count = var.created ? 1 : 0

  name                        = local.queue_name
  delay_seconds               = var.delay_seconds
  max_message_size            = var.max_message_size
  message_retention_seconds   = var.message_retention_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  content_based_deduplication = var.content_based_deduplication
  fifo_queue                  = var.fifo_queue

  redrive_policy = local.redrive_policy

  tags = module.tags.commontags

  depends_on = [
    aws_sqs_queue.sqs_queue_deadletter
  ]
}

resource "aws_sqs_queue" "sqs_queue_deadletter" {
  count = var.created && var.create_deadletter_queue ? 1 : 0

  name                       = local.deadletter_queue_name
  delay_seconds              = var.delay_seconds
  fifo_queue                 = var.fifo_queue
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  tags = merge(
    module.tags.commontags,
    {
      Name = local.deadletter_queue_name
    }
  )

}

resource "aws_sqs_queue_policy" "sqs_queue_policy" {
  count = var.created && length(var.queue_policy) > 0 ? 1 : 0

  queue_url = aws_sqs_queue.sqs_queue[0].id
  policy    = var.queue_policy
}

module "tags" {
  source              = "git::http://bitbucket.us.aegon.com/scm/tacloudmodule/transamerica.cloud.module.common-tags.git?ref=v1.0.0"
  name                = local.queue_name
  billing_cost_center = var.billing_cost_center
  environment         = lower(var.environment)
  resource_contact    = lower(var.resource_contact)
  resource_purpose    = var.resource_purpose
  division            = lower(var.division)
  channel             = var.channel
  application         = var.cmdb_application
  additional_tags     = var.additional_tags
}
