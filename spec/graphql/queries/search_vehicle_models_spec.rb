require 'rails_helper'

describe 'Search Vehicle Models', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      query($filter: VehicleModelFilter) {
          searchVehicleModels(filter: $filter) {
            id
            name
            description
            vehicle_make {
              name
            }
            vehicle {
              name
            }
          }
        }
    GRAPHQL
  end

  let!(:vehicle_models) { create_list(:vehicle_model, 3, description: 'just for test')}
  let!(:other_vehicle_models) { create_list(:vehicle_model, 3, description: 'nothing')}

  it 'returns array of vehicle models ' do
    response = client.execute(query, filter: { description_cont: 'test' })
    vehicle_models = response.data.search_vehicle_models
    expect(vehicle_models.size).to eq 3
  end

  it 'return empty' do
    response = client.execute(query, filter: { name_cont: 'none' })
    vehicle_models = response.data.search_vehicle_models
    expect(vehicle_models).to eq []
  end
end

