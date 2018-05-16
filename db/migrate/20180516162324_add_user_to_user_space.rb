class AddUserToUserSpace < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_spaces, :user, foreign_key: true
  end
end
