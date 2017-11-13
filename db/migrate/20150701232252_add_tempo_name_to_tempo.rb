class AddTempoNameToTempo < ActiveRecord::Migration
  def change
    add_column :tempos, :tempo_name, :string
  end
end
