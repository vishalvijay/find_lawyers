class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :years_of_experience
      t.string :location, null: false
      t.float :average_rating

      t.timestamps
    end
    add_index :lawyers, :location
    add_index :lawyers, :code, unique: true
  end
end
