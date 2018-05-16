class AddSpaceToUserSpace < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_spaces, :space, foreign_key: true
  end
end
