Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :searchVehicleModels, function: Resolvers::VehicleModels::SearchVehicleModels
end
