class CreatePlaceReviews < ActiveRecord::Migration
  def change
    create_table :place_reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
