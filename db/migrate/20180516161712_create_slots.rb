class CreateSlots < ActiveRecord::Migration[5.1]
  def change
    create_table :slots do |t|
      t.integer :count
      t.float :price

      t.timestamps
    end
  end
end
