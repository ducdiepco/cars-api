require "cars/validation/form"

module VehicleMakes
  module Validation
    Form = Cars::Validation.Form do
      required(:name).filled(:str?)
      required(:description).filled(:str?)
    end
  end
end
