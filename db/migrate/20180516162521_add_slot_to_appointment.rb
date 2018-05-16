class AddSlotToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :slot, foreign_key: true
  end
end
