class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :city
      t.string :state_2
      t.string :zip
      t.string :state
      t.string :lat
      t.string :long
      t.string :time_offset
      t.string :dst

      t.timestamps
    end
  end
end
