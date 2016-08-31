class AddScoreToPlacesReviews < ActiveRecord::Migration
  def change
    add_column :places_reviews, :score, :integer, default: 0
  end
end
