class AddNameToChords < ActiveRecord::Migration
  def change
    add_column :chords, :name, :string
  end
end
