class AddLatLongToZips < ActiveRecord::Migration
  def change
    add_column :zips, :lat, :string
    add_column :zips, :long, :string
  end
end
