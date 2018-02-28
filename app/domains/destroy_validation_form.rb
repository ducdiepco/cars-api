require "cars/validation/form"

DestroyValidationForm = Cars::Validation.Form do
  required(:id).filled(:int?)
end
