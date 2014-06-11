class AddGrandPoobahToUsers < ActiveRecord::Migration
  def change
    add_column :users, :grand_poobah, :boolean
  end
end
