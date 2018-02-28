class Resolvers::VehicleOptionValues::CreateVehicleOptionValue < Resolvers::BaseResolver
  argument :name, !types.String
  argument :description, types.String
  argument :vehicle_option_type_id, !types.Int

  type Types::VehicleOptionValueType

  def call(_ctx, args, obj)
    result = ::VehicleOptionValues::CreateCommand.run(args.to_h)
    if result.success?
      result.value
    else
      graphql_errors result.value
    end
  end
end
