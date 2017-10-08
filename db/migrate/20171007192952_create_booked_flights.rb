class CreateBookedFlights < ActiveRecord::Migration
  def change
    create_table :booked_flights do |t|
      t.references :flight, index: true
      t.string :session_id

      t.timestamps
    end
  end
end
