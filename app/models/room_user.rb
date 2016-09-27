class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum role: { '悪魔': 0, '村人': 1, '占い師': 2}
end
