class CreateStukStarterRewards < ActiveRecord::Migration
  def change
    create_table :stuk_starter_rewards do |t|
      t.references :stuk_starter_project, index: true, foreign_key: true
      t.text :description
      t.integer :value
      t.decimal :shipping, precision: 8, scale: 2
      t.integer :number_available
      t.date :estimated_delivery

      t.timestamps null: false
    end
  end
end
