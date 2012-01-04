module JSON
  class Schema
    class MaximumInclusiveAttribute < Attribute
      def self.validate(current_schema, data, fragments, validator, options = {})
        if data.is_a?(Numeric)
          if (current_schema.schema['maximumCanEqual'] == false ? data >= current_schema.schema['maximum'] : data > current_schema.schema['maximum'])
            message = "The property '#{build_fragment(fragments)}' did not have a maximum value of #{current_schema.schema['maximum']}, "
            message += current_schema.schema['exclusiveMaximum'] ? 'exclusively' : 'inclusively'
            validation_error(message, fragments, current_schema, options[:record_options])
          end
        end
      end
    end
  end
end
