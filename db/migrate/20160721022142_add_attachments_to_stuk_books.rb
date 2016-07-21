class AddAttachmentsToStukBooks < ActiveRecord::Migration
  def change
    add_column :stuk_books, :image, :string
    add_column :stuk_books, :resource, :string
  end
end
