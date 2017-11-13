class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :tonic
      t.string :quality

      t.timestamps null: true
    end
  end
end
