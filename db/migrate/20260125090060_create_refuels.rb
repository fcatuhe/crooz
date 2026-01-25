class CreateRefuels < ActiveRecord::Migration[8.1]
  def change
    create_table :refuels do |t|
      t.decimal :liters, precision: 10, scale: 2, null: false
      t.integer :price_cents
      t.string :fuel_type
      t.boolean :full_tank, null: false, default: false

      t.timestamps
    end
  end
end
