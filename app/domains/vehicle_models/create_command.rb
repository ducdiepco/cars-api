module VehicleModels
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
      vehicle_model = VehicleModel.new(params)
      if vehicle_model.save
        Right(vehicle_model)
      else
        Left(vehicle_model)
      end
    end
  end
end
