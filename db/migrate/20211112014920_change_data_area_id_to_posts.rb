class ChangeDataAreaIdToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :area_id, :integer
  end
end
