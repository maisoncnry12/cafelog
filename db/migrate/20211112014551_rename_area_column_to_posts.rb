class RenameAreaColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :area, :area_id
  end
end
