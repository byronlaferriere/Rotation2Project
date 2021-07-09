# SQS
A reusable module for deploying an SQS Queue and deadletter queue.
* [Home](#SQS)
* [Inputs](##Inputs)
* [Resources Created](##ResourcesCreated)
* [Outputs](##Outputs)
* [Changelog](##Changelog)

## Inputs
* Required
    * source
        *  Must be `"git::http://bitbucket.us.aegon.com/scm/tacloudmodule/transamerica.cloud.modules.sqs.git?ref=v1.0."` Do Not change this value!
    * department
        * Department that owns the distribution. Will be used in created resource names.
    * application
        * Application running on the distribution. Will be used in created resource names.
    * channel
        * What Channel this resource belongs to. Will be value of the tag `Channel`.
    * environment
        * Environment for the deployment (dev/tst/mdl/prd). Will be value of the tag `Environment` and will be used in created resource names.
    * resource_contact
        * Resource contact for the resources (team distro or individual). Will be value of the tag `ResourceContact`.
    * resource_purpose
        * Purpose of the resources i.e. what it is used for. Will be value of the tag `ResourcePurpose`.
* Optional (have been defaulted)
    * created
        * Whether or not to enable resource creation. If false, no resources will be created in this module. Defaults to `true`.
    * create_deadletter_queue
        * Whether or not to create an associated deadletter queue. Defaults to `true`.
    * division
        * Division that owns the resources.  Will be value of the tag `Division`. Defaults to `transamerica`.
    * billing_cost_center
        * Cost center for billing and reporting. Will be value of the tag `BillingCostCenter`. Defaults to `0701-TTA05000 Technology General Support`.
    * additional_tags
        * A mapping of additional tags to assign to the resource (defaults to `{}`).
    * delay_seconds
        * The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) (defaults to `0`).
    * fifo_queue
        * Boolean designating a FIFO queue (defaults to `true`).
    * max_message_size
        * The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) (defaults to `262114`).
    * message_retention_seconds
        * The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) (defaults to `345600`).
    * queue_name
        * This is the human-readable name of the queue. If omitted, Terraform will assign a random name.
    * queue_name_deadletter
        * This is the human-readable name of the deadletterqueue.
    * receive_wait_time_seconds
        * The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) (defaults to `0`).
    * max_receive_count
        * The number of times a message is delivered to the source queue before being moved to the dead-letter queue (defaults to `4`).
    * visibility_timeout_seconds
        * The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). The default for this attribute is 30.
    * content_based_deduplication
        * Enables content-based deduplication for FIFO queues. Default to false for non-FIFO queues.
    * queue_policy
        * An optional JSON access policy to attach to the SQS Queue. Defaults to empty string.
* Shouldn't be changed or specified
    * region
        * Region to launch the resources in (defaults to us-east-1).
## Resources Created
This module will create the following resources:
* SQS Queue
  * Optionally attaches a policy to this queue
* SQS Deadletter Queue (Optional)
## Outputs
Below are the values returned by the module. you can retrieve them by using `"${module.#MODULE_NAME#.#VARIABLE_NAME#}"`

## Changelog
* Version 1.0.3 (3/15/2021)
  * Introduce content_based_deduplication variable
* Version 1.0.2 (2/3/2021)
  * Add boolean variable which controls creation of deadletter queue
  * Add policy variable to allow adding an access policy to the queue
* Version 1.0.1 (1/26/2021)
  * Introduce visibility_timeout_seconds variable
* Version 1.0.0 (1/25/2021)
  * Initial creation of module.
