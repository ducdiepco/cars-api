require "rails_helper"
describe VehicleMakes::CreateCommand do
  describe "#call" do
    let(:params) {
      {
        name:     'ford',
        description: 'ford manufactor'
      }
    }
    it "create a new manufacture" do
      result = described_class.new.(params)
      vehicle_make = result.value
      expect(result.success?).to eq true
      expect(vehicle_make.id).not_to eq nil
    end

    it "return error with missing name message" do
      params[:name] = nil
      result = described_class.new.(params)
      vehicle_make = result.value
      errors = {:name=>["must be filled"]}
      expect(result.failure?).to eq true
      expect(vehicle_make.errors).to eq errors
    end
  end
end
