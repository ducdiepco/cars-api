class CreateVehicleModelOptionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_model_option_types do |t|
      t.references :vehicle_model, index: true, foreign_key: true
      t.references :vehicle_option_type, index: true, foreign_key: true
      t.timestamps
    end
  end
end
