class OrderedJSONB
  class Type < ActiveRecord::Type::Value
    def type
      :jsonb
    end

    def cast(value)
      return {} if value.blank?
      hairstyle_hash_with_order(value.with_indifferent_access)
    end

    def deserialize(value)
      if String === value
        decoded = ::ActiveSupport::JSON.decode(value)
        hairstyle_hash_with_order(decoded)
      else
        super
      end
    end

    def serialize(value)
      case value
      when Hash
        value = value.with_indifferent_access
        unless value[:order]
          new_value = {}
          new_value[:order] = value.keys
          new_value[:attributes] = value
          value = new_value
        end

        ::ActiveSupport::JSON.encode(value)
      else
        super
      end
    end

    private

    def hairstyle_hash_with_order(decoded)
      if decoded["order"]
        decoded["order"].reduce({}) do |collector, id|
          collector.merge(id => decoded["attributes"][id])
        end
      else
        decoded
      end
    end
  end
end
