class AddPriceToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :price, :integer
  end
end
