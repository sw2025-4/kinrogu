class AddLatitudeAndLongitudeToReviews < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :latitude, :float
    add_column :reviews, :longitude, :float
  end
end
