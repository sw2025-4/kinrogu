class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.string :storename
      t.string :location
      t.string :comment
      t.string :star
      t.string :category

      t.timestamps
    end
  end
end
