require "rails_helper"
describe VehicleOptionTypes::CreateCommand do
  describe "#call" do
    let(:params) {
      {
        name:     'trim',
        description: 'Trim Option'
      }
    }
    it "create a new vehicle option" do
      result = described_class.new.(params)
      option_type = result.value
      expect(result.success?).to eq true
      expect(option_type.id).not_to eq nil
    end

    it "return error with missing name message" do
      params[:name] = nil
      result = described_class.new.(params)
      option_type = result.value
      errors = {:name=>["must be filled"]}
      expect(result.failure?).to eq true
      expect(option_type.errors).to eq errors
    end
  end
end
