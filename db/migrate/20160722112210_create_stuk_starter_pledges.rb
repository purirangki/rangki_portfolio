class CreateStukStarterPledges < ActiveRecord::Migration
  def change
    create_table :stuk_starter_pledges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stuk_starter_reward, index: true, foreign_key: true
      t.integer :amount
      t.decimal :shipping
      t.date :expiration_date
      t.string :uuid
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :status

      t.timestamps null: false
    end
  end
end
