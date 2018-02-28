Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createVehicleModel, function: Resolvers::VehicleModels::CreateVehicleModel.new
  field :updateVehicleModel, function: Resolvers::VehicleModels::UpdateVehicleModel.new
  field :createVehicleOptionValue, function: Resolvers::VehicleOptionValues::CreateVehicleOptionValue.new
  field :createVehicleOptionType, function: Resolvers::VehicleOptionTypes::CreateVehicleOptionType.new
end
