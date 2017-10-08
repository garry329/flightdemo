class AddDurationToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :duration, :string
  end
end
