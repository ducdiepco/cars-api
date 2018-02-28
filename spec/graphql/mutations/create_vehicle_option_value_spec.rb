require 'rails_helper'

describe 'Create Vehicle Option Value', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      mutation($name: String!, $description: String, $vehicle_option_type_id: Int!) {
        createVehicleOptionValue(name: $name, description: $description, vehicle_option_type_id: $vehicle_option_type_id, ) {
          id
          name
          vehicle_option_type {
            name
          }
        }
      }
    GRAPHQL
  end

  let(:params) do
    {
      name:                   '1.8 TFSI Premium Plus 2dr Convertible (1.8L 4cyl Turbo 6AM)',
      vehicle_option_type_id: create(:vehicle_option_type, name: 'trim').id,
    }
  end

  it 'returns a new vehicle option value' do
    response = client.execute(query, params)
    option_value = response.data.create_vehicle_option_value
    expect(option_value.id).not_to eq nil
    expect(option_value.name).to eq params[:name]
    expect(option_value.vehicle_option_type.name).to eq 'trim'
  end

  it 'raise error when vehicle_option_type id not found' do
    params[:vehicle_option_type_id] = 999
    expect { client.execute(query, params) }.to raise_error(Graphlient::Errors::ExecutionError, /{"vehicle_option_type"=>"must exist"}/)
  end
end
