module VehicleMakes
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
      vehicle = VehicleMake.new(params)
      if vehicle.save
        Right(vehicle)
      else
        Left(vehicle)
      end
    end
  end
end
