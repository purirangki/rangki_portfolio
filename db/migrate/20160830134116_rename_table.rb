class RenameTable < ActiveRecord::Migration
  def change
    rename_table :place_reviews, :places_reviews
  end
end
