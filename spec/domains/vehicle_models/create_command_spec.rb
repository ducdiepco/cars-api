require "rails_helper"
describe VehicleModels::CreateCommand do
  describe "#call" do
    let(:vehicle)             { create(:vehicle)}
    let(:vehicle_make)        { create(:vehicle_make)}
    let(:trim_option)         { create(:vehicle_option_type, name: 'trim')}
    let(:transmission_option) { create(:vehicle_option_type, name: 'tranmission')}
    let(:params) {
      {
        name:                    'ford',
        description:             'ford manufactor',
        vehicle_make_id:         vehicle_make.id,
        vehicle_id:              vehicle.id,
        vehicle_option_type_ids: [trim_option.id, transmission_option.id ]
      }
    }
    it "create a new vehicle model" do
      result = described_class.new.(params)
      vehicle_model = result.value
      expect(result.success?).to eq true
      expect(vehicle_model.id).not_to eq nil
      expect(vehicle_model.id).not_to eq nil
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
