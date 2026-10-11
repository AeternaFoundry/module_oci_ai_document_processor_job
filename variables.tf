variable "ai_document_processor_jobs" {
  description = <<EOT
Map of ai_document_processor_jobs, attributes below
Required:
    - compartment_id
    - input_location (block):
        - data (optional)
        - object_locations (optional, block):
            - bucket (optional)
            - namespace (optional)
            - object (optional)
            - page_range (optional)
        - page_range (optional)
        - source_type (required)
    - output_location (block):
        - bucket (required)
        - namespace (required)
        - prefix (required)
    - processor_config (block):
        - document_type (optional)
        - features (required, block):
            - feature_type (required)
            - generate_searchable_pdf (optional)
            - max_results (optional)
            - model_id (optional)
            - selection_mark_detection (optional)
            - tenancy_id (optional)
        - is_zip_output_enabled (optional)
        - language (optional)
        - model_id (optional)
        - normalization_fields (optional, block):
            - map (optional, block):
                - normalization_type (optional)
        - processor_type (required)
Optional:
    - display_name
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    display_name   = optional(string)
    input_location = object({
      data = optional(string)
      object_locations = optional(list(object({
        bucket     = optional(string)
        namespace  = optional(string)
        object     = optional(string)
        page_range = optional(list(string))
      })))
      page_range  = optional(list(string))
      source_type = string
    })
    output_location = object({
      bucket    = string
      namespace = string
      prefix    = string
    })
    processor_config = object({
      document_type = optional(string)
      features = list(object({
        feature_type             = string
        generate_searchable_pdf  = optional(bool)
        max_results              = optional(number)
        model_id                 = optional(string)
        selection_mark_detection = optional(bool)
        tenancy_id               = optional(string)
      }))
      is_zip_output_enabled = optional(bool)
      language              = optional(string)
      model_id              = optional(string)
      normalization_fields = optional(list(object({
        map = optional(list(object({
          normalization_type = optional(string)
        })))
      })))
      processor_type = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ai_document_processor_jobs : (
        length(v.processor_config.features) >= 1
      )
    ])
    error_message = "Each features list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_document_processor_jobs : (
        contains([for v in ["INLINE_DOCUMENT_CONTENT", "OBJECT_STORAGE_LOCATIONS"] : lower(v)], lower(v.input_location.source_type))
      )
    ])
    error_message = "must be one of: \"INLINE_DOCUMENT_CONTENT\", \"OBJECT_STORAGE_LOCATIONS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_document_processor_jobs : (
        contains([for v in ["GENERAL", "INVOICE"] : lower(v)], lower(v.processor_config.processor_type))
      )
    ])
    error_message = "must be one of: \"GENERAL\", \"INVOICE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.ai_document_processor_jobs : (
        alltrue([for item in v.processor_config.features : (contains([for v in ["DOCUMENT_CLASSIFICATION", "DOCUMENT_ELEMENTS_EXTRACTION", "KEY_VALUE_EXTRACTION", "LANGUAGE_CLASSIFICATION", "TABLE_EXTRACTION", "TEXT_EXTRACTION"] : lower(v)], lower(item.feature_type)))])
      )
    ])
    error_message = "must be one of: \"DOCUMENT_CLASSIFICATION\", \"DOCUMENT_ELEMENTS_EXTRACTION\", \"KEY_VALUE_EXTRACTION\", \"LANGUAGE_CLASSIFICATION\", \"TABLE_EXTRACTION\", \"TEXT_EXTRACTION\""
  }
}

