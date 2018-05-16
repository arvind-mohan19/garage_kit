class CreateSlotTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :slot_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
