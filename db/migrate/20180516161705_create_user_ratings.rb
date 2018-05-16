class CreateUserRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ratings do |t|
      t.float :rating
      t.bigint :reviewer

      t.timestamps
    end
  end
end
