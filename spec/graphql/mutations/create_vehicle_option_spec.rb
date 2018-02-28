require 'rails_helper'

describe 'Create Vehicle Option Type', type: :request do
  include_context 'GraphQL Client'

  let(:query) do
    <<-GRAPHQL
      mutation($name: String!, $description: String) {
        createVehicleOptionType(name: $name, description: $description) {
          id
          name
          description
        }
      }
    GRAPHQL
  end

  let(:params) do
    {
      name:        'transmission',
      description: 'transmission option',
    }
  end

  it 'returns a new vehicle option' do
    response = client.execute(query, params)
    option_value = response.data.create_vehicle_option_type
    expect(option_value.id).not_to eq nil
    expect(option_value.name).to eq params[:name]
    expect(option_value.description).to eq params[:description]
  end

  it 'raise error when name is missing' do
    params[:name] = nil
    expect { client.execute(query, params) }.to raise_error(Graphlient::Errors::GraphQLError, /type String! was provided invalid value/)
  end
end
