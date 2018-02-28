module Cars
  module Validation
    class Form < Dry::Validation::Schema::Form
      configure do |config|
        config.messages = :i18n

        def vehicle_option_type_exist?(value)
          VehicleOptionType.exists? value
        end
      end

    end

    def self.Form(&block)
      Dry::Validation.Schema(Form, &block)
    end
  end
end
