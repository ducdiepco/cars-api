require 'rails_helper'

describe 'Create Vehicle Model', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      mutation($name: String!, $description: String, $vehicle_make_id: Int!, $vehicle_id: Int!, $vehicle_option_type_ids: [Int]) {
        createVehicleModel(name: $name, description: $description, vehicle_make_id: $vehicle_make_id, vehicle_id: $vehicle_id, vehicle_option_type_ids: $vehicle_option_type_ids) {
          id
          vehicle {id}
          vehicle_make {id}
        }
      }
    GRAPHQL
  end

  let(:params) do
    {
      name: 'ford',
      vehicle_id: create(:vehicle).id,
      vehicle_make_id: create(:vehicle_make).id,
      vehicle_option_type_ids: [create(:vehicle_option_type).id, create(:vehicle_option_type).id]
    }
  end

  it 'returns a new vehicle model ' do
    response = client.execute(query, params)
    vehicle_model = response.data.create_vehicle_model
    expect(vehicle_model.id).not_to eq nil
    expect(vehicle_model.vehicle.id).not_to eq nil
    expect(vehicle_model.vehicle_make.id).not_to eq nil
  end

  it 'raise error when vehicle option types not exist' do
    params[:vehicle_option_type_ids] = [99, 9999]
    expect {client.execute(query, params)}.to raise_error(Graphlient::Errors::ExecutionError, /Vehicle Option Type not found/)
  end

  it 'raise error when vehicle id not found' do
    params[:vehicle_id] = 999
    expect { client.execute(query, params) }.to raise_error(Graphlient::Errors::ExecutionError, /{"vehicle"=>"must exist"}/)
  end
end
