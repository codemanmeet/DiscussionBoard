class AddDislikearrayToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :dislikearray, :text
  end
end
