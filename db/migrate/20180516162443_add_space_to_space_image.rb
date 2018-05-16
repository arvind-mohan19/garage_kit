class AddSpaceToSpaceImage < ActiveRecord::Migration[5.1]
  def change
    add_reference :space_images, :space, foreign_key: true
  end
end
