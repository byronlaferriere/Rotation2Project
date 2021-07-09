resource "aws_sns_topic" "ta_sns_topic" {
  count                                    = var.created ? 1 : 0
  name                                     = local.topic_name
  display_name                             = var.display_name
  policy                                   = var.policy
  delivery_policy                          = var.delivery_policy
  application_success_feedback_role_arn    = var.application_success_feedback_role_arn
  application_success_feedback_sample_rate = var.application_success_feedback_sample_rate
  application_failure_feedback_role_arn    = var.application_failure_feedback_role_arn
  http_success_feedback_role_arn           = var.http_success_feedback_role_arn
  http_success_feedback_sample_rate        = var.http_success_feedback_sample_rate
  http_failure_feedback_role_arn           = var.http_failure_feedback_role_arn
  lambda_success_feedback_role_arn         = var.lambda_success_feedback_role_arn
  lambda_success_feedback_sample_rate      = var.lambda_success_feedback_sample_rate
  lambda_failure_feedback_role_arn         = var.lambda_failure_feedback_role_arn
  sqs_success_feedback_role_arn            = var.sqs_success_feedback_role_arn
  sqs_success_feedback_sample_rate         = var.sqs_success_feedback_sample_rate
  sqs_failure_feedback_role_arn            = var.sqs_failure_feedback_role_arn
  kms_master_key_id                        = var.kms_master_key_id
  tags                                     = module.tags.commontags
}

resource "aws_sns_topic_subscription" "sns_notify" {
  count                           = var.created ? length(var.sns_subscriptions) : 0
  topic_arn                       = aws_sns_topic.ta_sns_topic[0].arn
  protocol                        = var.sns_subscriptions[count.index]["PROTOCOL"]
  endpoint                        = var.sns_subscriptions[count.index]["ENDPOINT"]
  endpoint_auto_confirms          = var.endpoint_auto_confirms
  confirmation_timeout_in_minutes = var.confirmation_timeout
  raw_message_delivery            = var.raw_message_delivery
  delivery_policy                 = var.delivery_policy
  filter_policy                   = var.filter_policy
}

module "tags" {
  source              = "git::http://bitbucket.us.aegon.com/scm/tacloudmodule/transamerica.cloud.module.common-tags.git?ref=v1.0.0"
  name                = local.topic_name
  billing_cost_center = var.billing_cost_center
  environment         = lower(var.environment)
  resource_contact    = lower(var.resource_contact)
  resource_purpose    = var.resource_purpose
  division            = lower(var.division)
  channel             = var.channel
  application         = var.cmdb_application
  additional_tags     = var.additional_tags
}
