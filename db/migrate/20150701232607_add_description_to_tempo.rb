class AddDescriptionToTempo < ActiveRecord::Migration
  def change
    add_column :tempos, :description, :string
  end
end
