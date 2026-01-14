class AddDetailsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :faculty, :string
    add_column :users, :grade, :string
  end
end
