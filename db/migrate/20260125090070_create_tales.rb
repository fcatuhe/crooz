class CreateTales < ActiveRecord::Migration[8.1]
  def change
    create_table :tales do |t|
      t.string :title, null: false
      t.string :slug
      t.text :body

      t.timestamps
    end

    add_index :tales, :slug, unique: true
  end
end
