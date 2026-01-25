class CreateCroozers < ActiveRecord::Migration[8.1]
  def change
    create_table :croozers do |t|
      t.references :tender, null: false, foreign_key: true
      t.references :croozable, null: false, polymorphic: true
      t.string :name, null: false
      t.string :slug
      t.string :reading_type, null: false, default: "odometer"
      t.string :reading_unit, null: false, default: "km"

      t.timestamps
    end

    add_index :croozers, :slug, unique: true
  end
end
