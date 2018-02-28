module VehicleOptionTypes
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
      option_type = VehicleOptionType.new(params)
      if option_type.save
        Right(option_type)
      else
        Left(option_type)
      end
    end
  end
end
