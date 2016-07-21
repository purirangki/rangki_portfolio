class CreateEStukSales < ActiveRecord::Migration
  def change
    create_table :e_stuk_sales do |t|
      t.string :buyer_email
      t.string :seller_email
      t.integer :amount
      t.string :guid
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
