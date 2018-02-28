require_relative './date_time_type'

Types::VehicleModelType = GraphQL::ObjectType.define do
  name "VehicleModel"
  description "vehicle model"

  field :id,                   !types.Int
  field :name,                 !types.String
  field :description,          types.String
  field :vehicle_make,         Types::VehicleMakeType
  field :vehicle,              Types::VehicleType
  field :vehicle_option_types, types[Types::VehicleOptionTypeType]
  field :created_at,           !Types::DATE_TIME_TYPE
end
