require 'graphlient'

RSpec.shared_context "GraphQL Client", shared_context: :metadata do
  let(:client) do
    Graphlient::Client.new('http://localhost:3000/graphql') do |client|
      client.http do |h|
        h.connection do |c|
          c.use Faraday::Adapter::Rack, app
        end
      end
    end
  end
end

