class CreateVehicleMakes < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_makes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
