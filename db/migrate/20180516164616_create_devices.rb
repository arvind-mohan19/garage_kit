class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :device_id
      t.boolean :logged_in, default: true

      t.timestamps
    end
  end
end
