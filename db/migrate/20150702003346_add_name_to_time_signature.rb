class AddNameToTimeSignature < ActiveRecord::Migration
  def change
    add_column :time_signatures, :name, :string
  end
end
