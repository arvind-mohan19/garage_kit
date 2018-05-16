class AddUserToUserRating < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_ratings, :user, foreign_key: true
  end
end
