class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :city
      t.string :state
      t.string :state_2
      t.string :zip

      t.timestamps
    end
  end
end
