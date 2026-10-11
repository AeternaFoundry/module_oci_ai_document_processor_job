output "ai_document_processor_jobs_id" {
  description = "Map of id values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no id are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ai_document_processor_jobs_compartment_id" {
  description = "Map of compartment_id values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no compartment_id are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "ai_document_processor_jobs_display_name" {
  description = "Map of display_name values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no display_name are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "ai_document_processor_jobs_input_location" {
  description = "Map of input_location values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no input_location are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => one(v.input_location) if v.input_location != null && length(v.input_location) > 0 }
}
output "ai_document_processor_jobs_lifecycle_details" {
  description = "Map of lifecycle_details values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "ai_document_processor_jobs_output_location" {
  description = "Map of output_location values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no output_location are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => one(v.output_location) if v.output_location != null && length(v.output_location) > 0 }
}
output "ai_document_processor_jobs_percent_complete" {
  description = "Map of percent_complete values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no percent_complete are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.percent_complete if v.percent_complete != null }
}
output "ai_document_processor_jobs_processor_config" {
  description = "Map of processor_config values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no processor_config are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => one(v.processor_config) if v.processor_config != null && length(v.processor_config) > 0 }
}
output "ai_document_processor_jobs_state" {
  description = "Map of state values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no state are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.state if v.state != null && length(v.state) > 0 }
}
output "ai_document_processor_jobs_time_accepted" {
  description = "Map of time_accepted values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no time_accepted are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.time_accepted if v.time_accepted != null && length(v.time_accepted) > 0 }
}
output "ai_document_processor_jobs_time_finished" {
  description = "Map of time_finished values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no time_finished are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.time_finished if v.time_finished != null && length(v.time_finished) > 0 }
}
output "ai_document_processor_jobs_time_started" {
  description = "Map of time_started values across all ai_document_processor_jobs, keyed the same as var.ai_document_processor_jobs except keys with no time_started are omitted"
  value       = { for k, v in oci_ai_document_processor_job.ai_document_processor_jobs : k => v.time_started if v.time_started != null && length(v.time_started) > 0 }
}

