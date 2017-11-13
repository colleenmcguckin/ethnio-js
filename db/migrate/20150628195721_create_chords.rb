class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.string :root
      t.string :quality
      t.string :audio_file

      t.timestamps null: false
    end
  end
end
