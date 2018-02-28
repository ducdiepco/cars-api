require "rails_helper"
describe VehicleOptionValues::CreateCommand do
  describe "#call" do
    let(:params) {
      {
        name:                   '1.8 TFSI Premium 2dr Convertible (1.8L 4cyl Turbo 6AM)',
        description:            'Trim Option value',
        vehicle_option_type_id: create(:vehicle_option_type).id
      }
    }
    it "create a new vehicle option value" do
      result = described_class.new.(params)
      option_value = result.value
      expect(result.success?).to eq true
      expect(option_value.id).not_to eq nil
      expect(option_value.vehicle_option_type_id).not_to eq nil
    end

    it "return error with missing vehicle_option_type_id message" do
      params[:vehicle_option_type_id] = nil
      result = described_class.new.(params)
      option_value = result.value
      errors = {:vehicle_option_type_id=>["must be filled"]}
      expect(result.failure?).to eq true
      expect(option_value.errors).to eq errors
    end
  end
end
