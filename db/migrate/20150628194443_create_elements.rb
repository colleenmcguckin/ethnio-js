class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :song_id
      t.integer :element_library_id
      t.integer :length
      t.text :note

      t.timestamps null: true
    end
  end
end
