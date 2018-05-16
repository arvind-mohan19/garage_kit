class AddSpaceToSlot < ActiveRecord::Migration[5.1]
  def change
    add_reference :slots, :space, foreign_key: true
  end
end
