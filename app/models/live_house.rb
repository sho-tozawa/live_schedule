class LiveHouse < ApplicationRecord
  validates :name, presence: true
  validates :the_nearest_station, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
