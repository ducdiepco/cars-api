require_relative 'date_time_type'

Types::VehicleOptionTypeType = GraphQL::ObjectType.define do
  name "VehicleOptionTypeType"
  description "vehicle option type"

  field :id,          !types.Int
  field :name,        !types.String
  field :description, types.String
  field :vehicle_option_values, types[Types::VehicleOptionValueType]
  field :created_at,  !Types::DATE_TIME_TYPE
end
