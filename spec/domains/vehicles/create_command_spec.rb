require "rails_helper"
describe Vehicles::CreateCommand do
  describe "#call" do
    let(:params) {
      {
        name:        'sedan',
        description: 'Sedan'
      }
    }
    it "create new vehicle" do
      result = described_class.new.(params)
      vehicle = result.value
      expect(result.success?).to eq true
      expect(vehicle.id).not_to eq nil
    end
  end
end
