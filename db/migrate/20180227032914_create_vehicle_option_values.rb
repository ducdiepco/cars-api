class CreateVehicleOptionValues < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_option_values do |t|
      t.string :name
      t.string :description
      t.references :vehicle_option_type, index: true, foreign_key: true
      t.timestamps
    end
  end
end
