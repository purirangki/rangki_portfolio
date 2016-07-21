class AddSlugsToStukBooks < ActiveRecord::Migration
  def change
    add_column :stuk_books, :slug, :string
    add_index :stuk_books, :slug, unique: true
  end
end
