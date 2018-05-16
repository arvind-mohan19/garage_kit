class AddUserToSpaceRating < ActiveRecord::Migration[5.1]
  def change
    add_reference :space_ratings, :user, foreign_key: true
  end
end
