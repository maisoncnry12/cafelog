class RemovePlofileImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :PlofileImageId, :string
  end
end
