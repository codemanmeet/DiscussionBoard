class AddLikearrayToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likearray, :text
  end
end
