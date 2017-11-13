class CreateLyrics < ActiveRecord::Migration
  def change
    create_table :lyrics do |t|
      t.integer :element_id
      t.integer :line_number
      t.text :lyric
      t.integer :song_id

      t.timestamps null: true
    end
  end
end
