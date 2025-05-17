class AddRatingToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :rating, :integer
  end
end
