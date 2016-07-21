class AddStateToEStukSales < ActiveRecord::Migration
  def change
    add_column :e_stuk_sales, :state, :string
    add_column :e_stuk_sales, :stripe_id, :string
    add_column :e_stuk_sales, :stripe_token, :string
    add_column :e_stuk_sales, :error, :text
  end
end
