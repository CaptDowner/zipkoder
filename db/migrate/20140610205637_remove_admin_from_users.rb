class RemoveAdminFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :string
  end
end
