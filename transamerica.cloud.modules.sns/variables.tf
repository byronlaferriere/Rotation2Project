variable "region" {
  type        = string
  description = "Region everything is executed in."
  default     = "us-east-1"
}

variable "account_number" {
  type        = string
  description = "Account number everything is executed in."
}

variable "environment" {
  type        = string
  description = "dtap environment (DEV/TST/MDL/ACC/PRD)"
}

variable "cmdb_application" {
  type        = string
  description = "This is the CMDB ID concatenated with a ':', and concatenated again with the CMDB Application name"
}

variable "billing_cost_center" {
  type        = string
  description = "provide a cost center for billing reporting"
}

variable "resource_contact" {
  type        = string
  description = "provide an email"
}

variable "resource_purpose" {
  type        = string
  description = "provide a discription of what your using this for"
}

variable "department" {
  type        = string
  description = "department that owns the autoscaling group (consumer)"
}

variable "application" {
  type        = string
  description = "application that uses the autoscaling group"
}

variable "division" {
  type        = string
  description = "Division responsible for instance (tag based on cloud custodian)"
}

variable "channel" {
  type        = string
  description = "Channel the application belongs to"
}

variable "created" {
  description = "Whether or not to create the SNS topic/subscriptions"
  type        = bool
  default     = true
}

variable "name" {
  description = "The friendly name for the SNS topic"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "The friendly suffix for the sns name"
  type        = string
  default     = "sns"
}

variable "display_name" {
  description = "The display name for the SNS topic"
  type        = string
  default     = null
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy"
  type        = string
  default     = null
}

variable "application_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default     = null
}

variable "additional_tags" {
  description = "Additional tags to attach to the SNS topic"
  type        = map(string)
  default     = {}
}

variable "protocol" {
  description = "(Required) The protocol to use. The possible values for this are: sqs, sms, lambda. (http or https are partially supported, email is an option but is unsupported)"
  type        = string
  default     = "lambda"
}

variable "endpoint" {
  description = "(Required) The endpoint to send data to, the contents will vary with the protocol."
  type        = string
  default     = null
}

variable "endpoint_auto_confirms" {
  description = "(Optional) Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty"
  type        = bool
  default     = false
}

variable "confirmation_timeout" {
  description = "(Optional) Integer indicating number of minutes to wait in retying mode for fetching subscription arn before marking it as failure."
  type        = number
  default     = 1
}

variable "raw_message_delivery" {
  description = "(Optional) Boolean indicating whether or not to enable raw message delivery"
  type        = bool
  default     = false
}

variable "filter_policy" {
  description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource."
  type        = string
  default     = null
}

# variable "create" {
#   description   = "Boolean to specify if you want to create the resource"
#   type          = bool
#   default       = false
# }

variable "sns_subscriptions" {
  description = "List of subscription parameters to be passed to create subscriptions"
  type = list(object({
    PROTOCOL = string
    ENDPOINT = string
  }))
  default = []
}


