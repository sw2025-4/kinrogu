class AddTagsToReviews < ActiveRecord::Migration[8.1]
  def change
    add_column :reviews, :tags, :json
  end
end
