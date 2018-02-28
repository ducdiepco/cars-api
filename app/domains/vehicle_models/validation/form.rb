require "cars/validation/form"

module VehicleModels
  module Validation
    Form = Cars::Validation.Form do
      required(:name).filled(:str?)
      optional(:description).filled(:str?)
      required(:vehicle_make_id).filled(:int?)
      required(:vehicle_id).filled(:int?)
      optional(:vehicle_option_type_ids).each(:int?, :vehicle_option_type_exist?)
    end
  end
end
