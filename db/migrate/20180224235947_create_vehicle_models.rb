class CreateVehicleModels < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_models do |t|
      t.string :name
      t.string :description
      t.references :vehicle_make, index: true, foreign_key: true
      t.references :vehicle, index: true, foreign_key: true
      t.timestamps
    end
  end
end

