require 'search_object/plugin/graphql'

class Resolvers::VehicleModels::SearchVehicleModels
  include SearchObject.module(:graphql)

  scope { VehicleModel.all }

  type !types[Types::VehicleModelType]

  VehicleModelFilter = GraphQL::InputObjectType.define do
    name 'VehicleModelFilter'
    argument :description_cont, types.String
    argument :name_cont, types.String
  end

  option :filter, type: VehicleModelFilter, with: :apply_filter

  def apply_filter(scope, value)
    query = ::VehicleModel.ransack(value)
    query.result(distinct: true)
  end
end
