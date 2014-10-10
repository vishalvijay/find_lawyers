class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :services, :code, unique: true
    add_index :services, :name
  end
end
