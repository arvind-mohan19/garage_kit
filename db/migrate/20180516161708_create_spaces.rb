class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.text :description
      t.float :average_rating

      t.timestamps
    end
  end
end
