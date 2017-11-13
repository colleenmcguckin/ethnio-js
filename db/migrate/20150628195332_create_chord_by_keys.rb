class CreateChordByKeys < ActiveRecord::Migration
  def change
    create_table :chord_by_keys do |t|
      t.integer :key_id
      t.integer :chord_id

      t.timestamps null: true
    end
  end
end
