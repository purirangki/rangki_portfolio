class CreateStukBooks < ActiveRecord::Migration
  def change
    create_table :stuk_books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.integer :price
      t.boolean :availability

      t.timestamps null: false
    end
  end
end
