class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum role: { author: 0, member: 1}
end
