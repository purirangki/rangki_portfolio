class AddUserIdToStukBooks < ActiveRecord::Migration
  def change
    add_column :stuk_books, :user_id, :integer
  end
end
