class AddDstToZips < ActiveRecord::Migration
  def change
    add_column :zips, :dst, :boolean, :default => true
  end
end
