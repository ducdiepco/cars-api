require_relative 'date_time_type'

Types::VehicleType = GraphQL::ObjectType.define do
  name "Vehicle"
  description "type of vehicle"

  field :id,          !types.Int
  field :name,        !types.String
  field :description, types.String
  field :created_at,  !Types::DATE_TIME_TYPE
end

