variable "region" {
  description = "Region to execute everything in."
  type        = string
  default     = "us-east-1"
}

variable "application" {
  description = "Application/Team that will use the resource."
  type        = string
}

variable "billing_cost_center" {
  description = "Cost Center this will get billed back to (required for Cloud Custodian)."
  type        = string
  default     = "0701-TTA05000 Technology General Support"
}

variable "channel" {
  description = "Transamerica Channel this resource belongs to."
  type        = string
}

variable "cmdb_application" {
  type        = string
  description = "This is the CMDB ID concatenated with a ':', and concatenated again with the CMDB Application name"
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes)"
  type        = number
  default     = 0
}

variable "department" {
  description = "Department that will own the resource."
  type        = string
}

variable "division" {
  description = "Division responsible for instance (tag based on cloud custodian)."
  type        = string
  default     = "transamerica"
}

variable "environment" {
  description = "SDLC Environment (dev/tst/mdl/acc/prd)."
  type        = string
}

variable "created" {
  description = "Whether or not to create the resources in the module. Defaults to `true`."
  type        = bool
  default     = true
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue"
  type        = bool
  default     = false
}

variable "max_message_size" {
  description = "The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB)"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)"
  type        = number
  default     = 345600
}

variable "queue_name" {
  description = "This is the human-readable name of the queue. If omitted, Terraform will assign a random name."
  type        = string
  default     = ""
}

variable "queue_name_deadletter" {
  description = "This is the human-readable name of the deadletterqueue."
  type        = string
  default     = ""
}

variable "create_deadletter_queue" {
  description = "Whether or not to create an associated deadletter queue. Defaults to `true`."
  type        = bool
  default     = true
}

variable "resource_contact" {
  description = "Contact for this entry (required for Cloud Custodian)."
  type        = string
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds)"
  type        = number
  default     = 0
}

variable "resource_purpose" {
  description = "Purpose of this entry (required for Cloud Custodian)."
  type        = string
}

variable "max_receive_count" {
  description = "The number of times a message is delivered to the source queue before being moved to the dead-letter queue"
  type        = number
  default     = 4
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue"
  type        = number
  default     = 30
}

variable "additional_tags" {
  description = "A mapping of additional tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "queue_policy" {
  description = "An optional JSON access policy to attach to the SQS Queue."
  type        = string
  default     = ""
}

variable "content_based_deduplication" {
  description = "Boolean designating content_based_deduplication for FIFO queues"
  type        = bool
  default     = false
}