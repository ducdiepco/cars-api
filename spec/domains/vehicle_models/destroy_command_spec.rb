require "rails_helper"
describe VehicleModels::DestroyCommand do
  describe "#call" do
    let(:vehicle_model)       { create(:vehicle_model, name: 'nissan pathfinder')}
    let(:params) {
      {
        id: vehicle_model.id,
      }
    }
    it "destroy vehicle model" do
      result = described_class.new.(params)
      expect(result.success?).to eq true
    end

    it "return validation error when id missing" do
      params[:id] = ''
      result = described_class.new.(params)
      expect(result.failure?).to eq true
      expect(result.value.errors).to eq({:id=>["must be filled"]})
    end

    it "return failure when id is not found" do
      params[:id] = 10
      result = described_class.new.(params)
      expect(result.value.exception.message).to eq('Couldn\'t find VehicleModel with \'id\'=10')
    end
  end
end
