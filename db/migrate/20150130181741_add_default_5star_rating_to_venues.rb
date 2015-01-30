class AddDefault5starRatingToVenues < ActiveRecord::Migration
  def change
    change_column_default(:venues, :rating, 5)
  end
end
