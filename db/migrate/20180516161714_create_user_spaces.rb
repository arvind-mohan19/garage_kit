class CreateUserSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :user_spaces do |t|

      t.timestamps
    end
  end
end
