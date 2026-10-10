output "lambda_event_source_mappings_id" {
  description = "Map of id values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lambda_event_source_mappings_amazon_managed_kafka_event_source_config" {
  description = "Map of amazon_managed_kafka_event_source_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.amazon_managed_kafka_event_source_config) if v.amazon_managed_kafka_event_source_config != null && length(v.amazon_managed_kafka_event_source_config) > 0 }
}
output "lambda_event_source_mappings_arn" {
  description = "Map of arn values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "lambda_event_source_mappings_batch_size" {
  description = "Map of batch_size values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.batch_size if v.batch_size != null }
}
output "lambda_event_source_mappings_bisect_batch_on_function_error" {
  description = "Map of bisect_batch_on_function_error values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.bisect_batch_on_function_error if v.bisect_batch_on_function_error != null }
}
output "lambda_event_source_mappings_destination_config" {
  description = "Map of destination_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.destination_config) if v.destination_config != null && length(v.destination_config) > 0 }
}
output "lambda_event_source_mappings_document_db_event_source_config" {
  description = "Map of document_db_event_source_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.document_db_event_source_config) if v.document_db_event_source_config != null && length(v.document_db_event_source_config) > 0 }
}
output "lambda_event_source_mappings_enabled" {
  description = "Map of enabled values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.enabled if v.enabled != null }
}
output "lambda_event_source_mappings_event_source_arn" {
  description = "Map of event_source_arn values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.event_source_arn if v.event_source_arn != null && length(v.event_source_arn) > 0 }
}
output "lambda_event_source_mappings_filter_criteria" {
  description = "Map of filter_criteria values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.filter_criteria) if v.filter_criteria != null && length(v.filter_criteria) > 0 }
}
output "lambda_event_source_mappings_function_arn" {
  description = "Map of function_arn values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.function_arn if v.function_arn != null && length(v.function_arn) > 0 }
}
output "lambda_event_source_mappings_function_name" {
  description = "Map of function_name values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.function_name if v.function_name != null && length(v.function_name) > 0 }
}
output "lambda_event_source_mappings_function_response_types" {
  description = "Map of function_response_types values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.function_response_types if v.function_response_types != null && length(v.function_response_types) > 0 }
}
output "lambda_event_source_mappings_kms_key_arn" {
  description = "Map of kms_key_arn values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.kms_key_arn if v.kms_key_arn != null && length(v.kms_key_arn) > 0 }
}
output "lambda_event_source_mappings_last_modified" {
  description = "Map of last_modified values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.last_modified if v.last_modified != null && length(v.last_modified) > 0 }
}
output "lambda_event_source_mappings_last_processing_result" {
  description = "Map of last_processing_result values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.last_processing_result if v.last_processing_result != null && length(v.last_processing_result) > 0 }
}
output "lambda_event_source_mappings_maximum_batching_window_in_seconds" {
  description = "Map of maximum_batching_window_in_seconds values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.maximum_batching_window_in_seconds if v.maximum_batching_window_in_seconds != null }
}
output "lambda_event_source_mappings_maximum_record_age_in_seconds" {
  description = "Map of maximum_record_age_in_seconds values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.maximum_record_age_in_seconds if v.maximum_record_age_in_seconds != null }
}
output "lambda_event_source_mappings_maximum_retry_attempts" {
  description = "Map of maximum_retry_attempts values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.maximum_retry_attempts if v.maximum_retry_attempts != null }
}
output "lambda_event_source_mappings_metrics_config" {
  description = "Map of metrics_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.metrics_config) if v.metrics_config != null && length(v.metrics_config) > 0 }
}
output "lambda_event_source_mappings_parallelization_factor" {
  description = "Map of parallelization_factor values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.parallelization_factor if v.parallelization_factor != null }
}
output "lambda_event_source_mappings_provisioned_poller_config" {
  description = "Map of provisioned_poller_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.provisioned_poller_config) if v.provisioned_poller_config != null && length(v.provisioned_poller_config) > 0 }
}
output "lambda_event_source_mappings_queues" {
  description = "Map of queues values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.queues if v.queues != null && length(v.queues) > 0 }
}
output "lambda_event_source_mappings_region" {
  description = "Map of region values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.region if v.region != null && length(v.region) > 0 }
}
output "lambda_event_source_mappings_scaling_config" {
  description = "Map of scaling_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.scaling_config) if v.scaling_config != null && length(v.scaling_config) > 0 }
}
output "lambda_event_source_mappings_self_managed_event_source" {
  description = "Map of self_managed_event_source values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.self_managed_event_source) if v.self_managed_event_source != null && length(v.self_managed_event_source) > 0 }
}
output "lambda_event_source_mappings_self_managed_kafka_event_source_config" {
  description = "Map of self_managed_kafka_event_source_config values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => one(v.self_managed_kafka_event_source_config) if v.self_managed_kafka_event_source_config != null && length(v.self_managed_kafka_event_source_config) > 0 }
}
output "lambda_event_source_mappings_source_access_configuration" {
  description = "Map of source_access_configuration values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.source_access_configuration if v.source_access_configuration != null && length(v.source_access_configuration) > 0 }
}
output "lambda_event_source_mappings_starting_position" {
  description = "Map of starting_position values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.starting_position if v.starting_position != null && length(v.starting_position) > 0 }
}
output "lambda_event_source_mappings_starting_position_timestamp" {
  description = "Map of starting_position_timestamp values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.starting_position_timestamp if v.starting_position_timestamp != null && length(v.starting_position_timestamp) > 0 }
}
output "lambda_event_source_mappings_state" {
  description = "Map of state values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.state if v.state != null && length(v.state) > 0 }
}
output "lambda_event_source_mappings_state_transition_reason" {
  description = "Map of state_transition_reason values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.state_transition_reason if v.state_transition_reason != null && length(v.state_transition_reason) > 0 }
}
output "lambda_event_source_mappings_tags" {
  description = "Map of tags values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "lambda_event_source_mappings_tags_all" {
  description = "Map of tags_all values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "lambda_event_source_mappings_topics" {
  description = "Map of topics values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.topics if v.topics != null && length(v.topics) > 0 }
}
output "lambda_event_source_mappings_tumbling_window_in_seconds" {
  description = "Map of tumbling_window_in_seconds values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.tumbling_window_in_seconds if v.tumbling_window_in_seconds != null }
}
output "lambda_event_source_mappings_use_resource_timeout_for_propagation" {
  description = "Map of use_resource_timeout_for_propagation values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.use_resource_timeout_for_propagation if v.use_resource_timeout_for_propagation != null }
}
output "lambda_event_source_mappings_uuid" {
  description = "Map of uuid values across all lambda_event_source_mappings, keyed the same as var.lambda_event_source_mappings"
  value       = { for k, v in aws_lambda_event_source_mapping.lambda_event_source_mappings : k => v.uuid if v.uuid != null && length(v.uuid) > 0 }
}

