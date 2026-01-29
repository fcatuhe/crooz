class AddNameAndSlugToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :slug, :string, null: false
    add_index :users, :slug, unique: true
  end
end
