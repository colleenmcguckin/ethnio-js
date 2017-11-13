class CreateTimeSignatures < ActiveRecord::Migration
  def change
    create_table :time_signatures do |t|
      t.integer :beat_unit
      t.integer :bar

      t.timestamps null: true
    end
  end
end
