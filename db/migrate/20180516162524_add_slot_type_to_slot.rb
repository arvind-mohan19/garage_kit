class AddSlotTypeToSlot < ActiveRecord::Migration[5.1]
  def change
    add_reference :slots, :slot_type, foreign_key: true
  end
end
