class VehicleOptionValue < ApplicationRecord
  belongs_to :vehicle_option_type, inverse_of: :vehicle_option_values
end
