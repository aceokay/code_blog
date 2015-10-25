class UpdateComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_id, :integer
    add_column :comments, :post_id, :integer
  end
end
