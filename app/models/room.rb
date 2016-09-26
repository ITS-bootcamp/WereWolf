class Room < ApplicationRecord
  has_many :users, through: :room_users
  has_many :room_users

  validates :author_id, presence: true
  validates :name, presence: true
end
