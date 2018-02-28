require "cars/validation/form"

module VehicleOptionValues
  module Validation
    Form = Cars::Validation.Form do
      required(:name).filled(:str?)
      required(:vehicle_option_type_id).filled(:int?)
      optional(:description).filled(:str?)
    end
  end
end
