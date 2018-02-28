module VehicleModels
  class DestroyCommand < BaseCommand

    step :validate
    try :destroy, catch: [ActiveRecord::RecordNotFound]

    def validate(params)
      validation = DestroyValidationForm.(params)
      if validation.success?
        Right(validation.output)
      else
        Left(validation)
      end
    end

    def destroy(params)
      VehicleModel.destroy(params[:id])
    end
  end
end
