class AddCheckToUser < ActiveRecord::Migration
  def change
    add_column :users, :check, :string
  end
end
