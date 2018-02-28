module VehicleModels
  class UpdateCommand < BaseCommand

    step :validate
    try :persist, catch: ActiveRecord::RecordNotFound

    def validate(params)
      validation = Validation::Form.(params)
      if validation.success?
        Right(id: params[:id], input: validation.output)
      else
        Left(validation)
      end
    end

    def persist(params)
      VehicleModel.update(params[:id], params[:input])
    end
  end
end
