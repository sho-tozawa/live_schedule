class AddTheNearestStationToLiveHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :live_houses, :the_nearest_station, :string
  end
end
