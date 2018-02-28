require "cars/validation/form"

module VehicleOptionTypes
  module Validation
    Form = Cars::Validation.Form do
      required(:name).filled(:str?)
      required(:description).filled(:str?)
    end
  end
end
