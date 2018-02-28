class VehicleModelOptionType < ApplicationRecord
  with_options inverse_of: :vehicle_model_option_types do
    belongs_to :vehicle_model
    belongs_to :vehicle_option_type
  end
end
