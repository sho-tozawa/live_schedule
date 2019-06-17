class AddUserIdToLiveHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :live_houses, :user_id, :integer
  end
end
