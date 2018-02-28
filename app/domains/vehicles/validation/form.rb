require "cars/validation/form"

Vehicles::Validation::Form = Cars::Validation.Form do
  required(:name).filled(:str?)
  optional(:description).filled(:str?)
end


