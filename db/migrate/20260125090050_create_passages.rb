class CreatePassages < ActiveRecord::Migration[8.1]
  def change
    create_table :passages do |t|
      t.references :croozer, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :passageable, null: false, polymorphic: true
      t.date :started_on, null: false
      t.decimal :start_reading, precision: 10, scale: 2
      t.decimal :end_reading, precision: 10, scale: 2

      t.timestamps
    end

    add_index :passages, %i[croozer_id started_on]
  end
end
