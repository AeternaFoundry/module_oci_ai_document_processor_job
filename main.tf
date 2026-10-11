resource "oci_ai_document_processor_job" "ai_document_processor_jobs" {
  for_each = var.ai_document_processor_jobs

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name

  input_location {
    data = each.value.input_location.data
    dynamic "object_locations" {
      for_each = each.value.input_location.object_locations != null ? each.value.input_location.object_locations : []
      content {
        bucket     = object_locations.value.bucket
        namespace  = object_locations.value.namespace
        object     = object_locations.value.object
        page_range = object_locations.value.page_range
      }
    }
    page_range  = each.value.input_location.page_range
    source_type = each.value.input_location.source_type
  }

  output_location {
    bucket    = each.value.output_location.bucket
    namespace = each.value.output_location.namespace
    prefix    = each.value.output_location.prefix
  }

  processor_config {
    document_type = each.value.processor_config.document_type
    dynamic "features" {
      for_each = each.value.processor_config.features
      content {
        feature_type             = features.value.feature_type
        generate_searchable_pdf  = features.value.generate_searchable_pdf
        max_results              = features.value.max_results
        model_id                 = features.value.model_id
        selection_mark_detection = features.value.selection_mark_detection
        tenancy_id               = features.value.tenancy_id
      }
    }
    is_zip_output_enabled = each.value.processor_config.is_zip_output_enabled
    language              = each.value.processor_config.language
    model_id              = each.value.processor_config.model_id
    dynamic "normalization_fields" {
      for_each = each.value.processor_config.normalization_fields != null ? each.value.processor_config.normalization_fields : []
      content {
        dynamic "map" {
          for_each = normalization_fields.value.map != null ? normalization_fields.value.map : []
          content {
            normalization_type = map.value.normalization_type
          }
        }
      }
    }
    processor_type = each.value.processor_config.processor_type
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

