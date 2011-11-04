class AddUserPostRelationship < ActiveRecord::Migration
  def up
	add_column :user, :post_id, :integer
  end

  def down
	add_column :posts, :user_id, :integer
  end
end
