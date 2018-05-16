class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :from_timestamp
      t.datetime :to_timestamp

      t.timestamps
    end
  end
end
