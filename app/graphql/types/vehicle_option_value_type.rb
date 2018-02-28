require_relative 'date_time_type'

Types::VehicleOptionValueType = GraphQL::ObjectType.define do
  name "VehicleOptionValue"
  description "vehicle option value"

  field :id,                  !types.Int
  field :vehicle_option_type, !Types::VehicleOptionTypeType
  field :name,                !types.String
  field :description,         types.String
  field :created_at,          !Types::DATE_TIME_TYPE
end
