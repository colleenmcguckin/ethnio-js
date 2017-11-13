class CreateElementLibraries < ActiveRecord::Migration
  def change
    create_table :element_libraries do |t|
      t.string :name

      t.timestamps null: true
    end
  end
end
