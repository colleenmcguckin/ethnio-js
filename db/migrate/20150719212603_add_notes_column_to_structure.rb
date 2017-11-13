class AddNotesColumnToStructure < ActiveRecord::Migration
  def change
    add_column :structures, :notes, :text
  end
end
