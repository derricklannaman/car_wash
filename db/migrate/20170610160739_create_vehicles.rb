class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :plate_number
      t.integer :visit_count

      t.timestamps
    end
  end
end
