require "rails_helper"
describe VehicleModels::UpdateCommand do
  describe "#call" do
    let(:vehicle_model)       { create(:vehicle_model, name: 'nissan pathfinder')}
    let(:trim_option)         { create(:vehicle_option_type, name: 'trim')}
    let(:transmission_option) { create(:vehicle_option_type, name: 'tranmission')}
    let(:params) {
      {
        id:                      vehicle_model.id,
        name:                    'nissan frontier',
        description:             'update description',
        vehicle_make_id:         vehicle_model.vehicle_make.id,
        vehicle_id:              vehicle_model.vehicle.id,
        vehicle_option_type_ids: [trim_option.id, transmission_option.id ]
      }
    }
    it "update vehicle model" do
      result = described_class.new.(params)
      vehicle_model = result.value
      expect(result.success?).to eq true
      expect(vehicle_model.name).to eq params[:name]
      expect(vehicle_model.vehicle_option_type_ids).to eq params[:vehicle_option_type_ids]
    end

    it "return failure when record not found" do
      params[:id] = 999
      result = described_class.new.(params)
      expect(result.failure?).to eq true
      expect(result.value.message).to eq 'Couldn\'t find VehicleModel with \'id\'=999'
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
