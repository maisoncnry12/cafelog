class RenameRecommendColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :recommend, :rate
  end
end
