class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :shop_name
      t.string :post_image_id
      t.text :body
      t.integer :recommend

      t.timestamps
    end
  end
end
