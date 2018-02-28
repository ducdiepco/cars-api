module VehicleOptionValues
  class CreateCommand < BaseCommand

    step :validate
    step :persist

    def validate(params)
      validation = Validation::Form.(params)
      if validation.success?
        Right(validation.output)
      else
        Left(validation)
      end
    end

    def persist(params)
      option_value = VehicleOptionValue.new(params)
      if option_value.save
        Right(option_value)
      else
        Left(option_value)
      end
    end
  end
end
