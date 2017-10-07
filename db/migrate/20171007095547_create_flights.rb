class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :location_from
      t.string :location_to
      t.string :boarding_time
      t.string :departure_time
      t.integer :gate_number

      t.timestamps
    end
  end
end
