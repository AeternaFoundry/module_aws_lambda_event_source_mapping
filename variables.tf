variable "lambda_event_source_mappings" {
  description = <<EOT
Map of lambda_event_source_mappings, attributes below
Required:
    - function_name
Optional:
    - batch_size
    - bisect_batch_on_function_error
    - enabled
    - event_source_arn
    - function_response_types
    - kms_key_arn
    - maximum_batching_window_in_seconds
    - maximum_record_age_in_seconds
    - maximum_retry_attempts
    - parallelization_factor
    - queues
    - region
    - starting_position
    - starting_position_timestamp
    - tags
    - tags_all
    - topics
    - tumbling_window_in_seconds
    - use_resource_timeout_for_propagation
    - amazon_managed_kafka_event_source_config (block):
        - consumer_group_id (optional)
        - schema_registry_config (optional, block):
            - access_config (optional, block):
                - type (optional)
                - uri (optional)
            - event_record_format (optional)
            - schema_registry_uri (optional)
            - schema_validation_config (optional, block):
                - attribute (optional)
    - destination_config (block):
        - on_failure (optional, block):
            - destination_arn (required)
    - document_db_event_source_config (block):
        - collection_name (optional)
        - database_name (required)
        - full_document (optional)
    - filter_criteria (block):
        - filter (optional, block):
            - pattern (optional)
    - metrics_config (block):
        - metrics (required)
    - provisioned_poller_config (block):
        - maximum_pollers (optional)
        - minimum_pollers (optional)
        - poller_group_name (optional)
    - scaling_config (block):
        - maximum_concurrency (optional)
    - self_managed_event_source (block):
        - endpoints (required)
    - self_managed_kafka_event_source_config (block):
        - consumer_group_id (optional)
        - schema_registry_config (optional, block):
            - access_config (optional, block):
                - type (optional)
                - uri (optional)
            - event_record_format (optional)
            - schema_registry_uri (optional)
            - schema_validation_config (optional, block):
                - attribute (optional)
    - source_access_configuration (block):
        - type (required)
        - uri (required)
EOT

  type = map(object({
    function_name                        = string
    topics                               = optional(set(string))
    tags_all                             = optional(map(string))
    tags                                 = optional(map(string))
    starting_position_timestamp          = optional(string)
    starting_position                    = optional(string)
    region                               = optional(string)
    queues                               = optional(list(string))
    parallelization_factor               = optional(number)
    maximum_retry_attempts               = optional(number)
    maximum_record_age_in_seconds        = optional(number)
    maximum_batching_window_in_seconds   = optional(number)
    kms_key_arn                          = optional(string)
    function_response_types              = optional(set(string))
    event_source_arn                     = optional(string)
    enabled                              = optional(bool)
    bisect_batch_on_function_error       = optional(bool)
    batch_size                           = optional(number)
    tumbling_window_in_seconds           = optional(number)
    use_resource_timeout_for_propagation = optional(bool)
    amazon_managed_kafka_event_source_config = optional(object({
      consumer_group_id = optional(string)
      schema_registry_config = optional(object({
        access_config = optional(list(object({
          type = optional(string)
          uri  = optional(string)
        })))
        event_record_format = optional(string)
        schema_registry_uri = optional(string)
        schema_validation_config = optional(list(object({
          attribute = optional(string)
        })))
      }))
    }))
    destination_config = optional(object({
      on_failure = optional(object({
        destination_arn = string
      }))
    }))
    document_db_event_source_config = optional(object({
      collection_name = optional(string)
      database_name   = string
      full_document   = optional(string)
    }))
    filter_criteria = optional(object({
      filter = optional(list(object({
        pattern = optional(string)
      })))
    }))
    metrics_config = optional(object({
      metrics = set(string)
    }))
    provisioned_poller_config = optional(object({
      maximum_pollers   = optional(number)
      minimum_pollers   = optional(number)
      poller_group_name = optional(string)
    }))
    scaling_config = optional(object({
      maximum_concurrency = optional(number)
    }))
    self_managed_event_source = optional(object({
      endpoints = map(string)
    }))
    self_managed_kafka_event_source_config = optional(object({
      consumer_group_id = optional(string)
      schema_registry_config = optional(object({
        access_config = optional(list(object({
          type = optional(string)
          uri  = optional(string)
        })))
        event_record_format = optional(string)
        schema_registry_uri = optional(string)
        schema_validation_config = optional(list(object({
          attribute = optional(string)
        })))
      }))
    }))
    source_access_configuration = optional(list(object({
      type = string
      uri  = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.filter_criteria == null || (v.filter_criteria.filter == null || (length(v.filter_criteria.filter) <= 10))
      )
    ])
    error_message = "Each filter list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.source_access_configuration == null || (length(v.source_access_configuration) <= 22)
      )
    ])
    error_message = "Each source_access_configuration list must contain at most 22 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.amazon_managed_kafka_event_source_config == null || (v.amazon_managed_kafka_event_source_config.consumer_group_id == null || (length(v.amazon_managed_kafka_event_source_config.consumer_group_id) >= 1 && length(v.amazon_managed_kafka_event_source_config.consumer_group_id) <= 200))
      )
    ])
    error_message = "must be between 1 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.amazon_managed_kafka_event_source_config == null || (v.amazon_managed_kafka_event_source_config.schema_registry_config == null || (v.amazon_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri == null || ((length(v.amazon_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri) >= 1 && length(v.amazon_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri) <= 10000) && (can(regex("[a-zA-Z0-9-/*:_+=.@-]*", v.amazon_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 10000 characters; must be ARN or URL of the registry"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.maximum_record_age_in_seconds == null || ((contains([-1], v.maximum_record_age_in_seconds)) || (v.maximum_record_age_in_seconds >= 60 && v.maximum_record_age_in_seconds <= 604800))
      )
    ])
    error_message = "any of: must be one of: -1; must be between 60 and 604800"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.maximum_retry_attempts == null || (v.maximum_retry_attempts >= -1 && v.maximum_retry_attempts <= 10000)
      )
    ])
    error_message = "must be between -1 and 10000"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.parallelization_factor == null || (v.parallelization_factor >= 1 && v.parallelization_factor <= 10)
      )
    ])
    error_message = "must be between 1 and 10"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.provisioned_poller_config == null || (v.provisioned_poller_config.maximum_pollers == null || (v.provisioned_poller_config.maximum_pollers >= 1 && v.provisioned_poller_config.maximum_pollers <= 2000))
      )
    ])
    error_message = "must be between 1 and 2000"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.provisioned_poller_config == null || (v.provisioned_poller_config.minimum_pollers == null || (v.provisioned_poller_config.minimum_pollers >= 1 && v.provisioned_poller_config.minimum_pollers <= 200))
      )
    ])
    error_message = "must be between 1 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.provisioned_poller_config == null || (v.provisioned_poller_config.poller_group_name == null || (length(v.provisioned_poller_config.poller_group_name) >= 1 && length(v.provisioned_poller_config.poller_group_name) <= 128))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.queues == null || (alltrue([for x in v.queues : length(x) >= 1 && length(x) <= 1000]))
      )
    ])
    error_message = "must be between 1 and 1000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.scaling_config == null || (v.scaling_config.maximum_concurrency == null || (v.scaling_config.maximum_concurrency >= 2))
      )
    ])
    error_message = "must be at least 2"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.self_managed_kafka_event_source_config == null || (v.self_managed_kafka_event_source_config.consumer_group_id == null || (length(v.self_managed_kafka_event_source_config.consumer_group_id) >= 1 && length(v.self_managed_kafka_event_source_config.consumer_group_id) <= 200))
      )
    ])
    error_message = "must be between 1 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.self_managed_kafka_event_source_config == null || (v.self_managed_kafka_event_source_config.schema_registry_config == null || (v.self_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri == null || ((length(v.self_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri) >= 1 && length(v.self_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri) <= 10000) && (can(regex("[a-zA-Z0-9-/*:_+=.@-]*", v.self_managed_kafka_event_source_config.schema_registry_config.schema_registry_uri))))))
      )
    ])
    error_message = "all of: must be between 1 and 10000 characters; must be ARN or URL of the registry"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.topics == null || (alltrue([for x in v.topics : length(x) >= 1 && length(x) <= 249]))
      )
    ])
    error_message = "must be between 1 and 249 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.lambda_event_source_mappings : (
        v.tumbling_window_in_seconds == null || (v.tumbling_window_in_seconds >= 0 && v.tumbling_window_in_seconds <= 900)
      )
    ])
    error_message = "must be between 0 and 900"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

