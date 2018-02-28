require_relative 'date_time_type'

Types::VehicleMakeType = GraphQL::ObjectType.define do
  name "VehicleMake"
  description "manufacture"

  field :id,          !types.Int
  field :name,        !types.String
  field :description, types.String
  field :created_at,  !Types::DATE_TIME_TYPE
end
