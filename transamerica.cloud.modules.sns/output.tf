output "sns_topic_arn" {
  description = "ARN of the SNS topic created"
  value       = concat(aws_sns_topic.ta_sns_topic.*.arn, [""])[0]
}

output "subscription_id" {
  description = "ARN of the subscription"
  value       = aws_sns_topic_subscription.sns_notify[*].id
}
