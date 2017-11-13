class CreateStructures < ActiveRecord::Migration
  def change
    create_table :structures do |t|
      t.integer :chord_id
      t.integer :position
      t.integer :song_id
      t.integer :element_id

      t.timestamps null: true
    end
  end
end
