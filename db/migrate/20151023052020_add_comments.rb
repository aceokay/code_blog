class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :title, :string
      t.column :body, :string
      t.column :user_id, :integer
      t.column :comment_id, :integer

      t.timestamps
    end

    add_column :users, :admin, :boolean
  end
end
