class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :name
      t.string :time_signature_id
      t.string :integer
      t.integer :key_id
      t.integer :tempo_id
      t.boolean :access

      t.timestamps null: true
    end
  end
end
