class Resolvers::VehicleOptionTypes::CreateVehicleOptionType < Resolvers::BaseResolver
  argument :name, !types.String
  argument :description, types.String

  type Types::VehicleOptionTypeType

  def call(_ctx, args, obj)
    result = ::VehicleOptionTypes::CreateCommand.run(args.to_h)
    if result.success?
      result.value
    else
      graphql_errors result.value
    end
  end
end
