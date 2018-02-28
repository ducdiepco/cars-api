class Resolvers::VehicleModels::CreateVehicleModel < Resolvers::BaseResolver
  argument :name, !types.String
  argument :description, types.String
  argument :vehicle_make_id, !types.Int
  argument :vehicle_id, !types.Int
  argument :vehicle_option_type_ids, types[types.Int]

  type Types::VehicleModelType

  def call(_ctx, args, obj)
    result = ::VehicleModels::CreateCommand.run(args.to_h)
    if result.success?
      result.value
    else
      graphql_errors result.value
    end
  end
end
