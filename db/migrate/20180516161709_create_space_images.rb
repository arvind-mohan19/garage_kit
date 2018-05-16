class CreateSpaceImages < ActiveRecord::Migration[5.1]
  def change
    create_table :space_images do |t|
      t.string :img_src

      t.timestamps
    end
  end
end
