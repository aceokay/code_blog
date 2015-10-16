class CreatePostAndTag < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :body, :string

      t.timestamps
    end

    create_table :tags do |t|
      t.column :category, :string

      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
    end
  end
end
