class ChangeDatatypeRateOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :rate, :float
  end
end
