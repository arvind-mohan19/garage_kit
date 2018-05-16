class CreateSpaceTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :space_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
