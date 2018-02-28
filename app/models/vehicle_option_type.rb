class VehicleOptionType < ApplicationRecord
  with_options dependent: :destroy, inverse_of: :vehicle_option_type do
    has_many :vehicle_option_values
    has_many :vehicle_model_option_types
  end

  has_many :vehicle_models, through: :vehicle_model_option_types
end
