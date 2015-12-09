class AddOrderscoreToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :orderscore, :integer
  end
end
