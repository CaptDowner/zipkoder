class AddTzOffsetToZips < ActiveRecord::Migration
  def change
    add_column :zips, :tz_offset, :string
  end
end
