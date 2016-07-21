class RenameColumnBook < ActiveRecord::Migration
  def change
    rename_column :e_stuk_sales, :book_id, :stuk_book_id
  end
end
