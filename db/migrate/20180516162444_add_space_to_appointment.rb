class AddSpaceToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_reference :appointments, :space, foreign_key: true
  end
end
