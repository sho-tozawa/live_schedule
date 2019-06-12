class LiveHouse < ApplicationRecord
  validates :name, presence: true
  validates :the_nearest_station, presence: true
end
