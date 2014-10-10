class CreateServiceCharges < ActiveRecord::Migration
  def change
    create_table :service_charges do |t|
      t.float :charge, null: false
      t.references :lawyer, index: true, null: false
      t.references :service, index: true, null: false

      t.timestamps
    end
  end
end
