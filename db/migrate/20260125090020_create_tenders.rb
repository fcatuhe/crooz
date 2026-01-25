class CreateTenders < ActiveRecord::Migration[8.1]
  def change
    create_table :tenders do |t|
      t.references :tenderable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
