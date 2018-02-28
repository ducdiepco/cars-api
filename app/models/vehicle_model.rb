class VehicleModel < ApplicationRecord
  belongs_to :vehicle_make
  belongs_to :vehicle

  has_many :vehicle_model_option_types, dependent: :destroy, inverse_of: :vehicle_model
  has_many :vehicle_option_types, through: :vehicle_model_option_types
end
