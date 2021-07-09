output "queue_arn" {
  description = "ARN of the SQS Queue created"
  value       = concat(aws_sqs_queue.sqs_queue.*.arn, [""])[0]
}

output "deadletter_queue_arn" {
  description = "ARN of the Deadletter SQS Queue created"
  value       = concat(aws_sqs_queue.sqs_queue_deadletter.*.arn, [""])[0]
}

output "queue_name" {
  description = "Name of the SQS Queue created"
  value       = concat(aws_sqs_queue.sqs_queue.*.name, [""])[0]
}

output "deadletter_queue_name" {
  description = "Name of the Deadletter SQS Queue created"
  value       = concat(aws_sqs_queue.sqs_queue_deadletter.*.name, [""])[0]
}
