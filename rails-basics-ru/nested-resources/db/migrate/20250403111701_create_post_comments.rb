class CreatePostComments < ActiveRecord::Migration[7.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
