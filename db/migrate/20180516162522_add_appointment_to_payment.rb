class AddAppointmentToPayment < ActiveRecord::Migration[5.1]
  def change
    add_reference :payments, :appointment, foreign_key: true
  end
end
