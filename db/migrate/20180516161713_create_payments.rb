class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.float :total
      t.float :advance
      t.float :pending
      t.float :estimate

      t.timestamps
    end
  end
end
