locals {
  queue_name            = length(var.queue_name) > 0 ? var.queue_name : lower("${var.department}-${var.application}-${var.environment}")
  deadletter_queue_name = length(var.queue_name_deadletter) > 0 ? var.queue_name_deadletter : "${local.queue_name}-deadletter"

  redrive_policy = var.created && var.create_deadletter_queue ? jsonencode(
    {
      deadLetterTargetArn = concat(aws_sqs_queue.sqs_queue_deadletter.*.arn, [""])[0]
      maxReceiveCount     = var.max_receive_count
  }) : ""

}
