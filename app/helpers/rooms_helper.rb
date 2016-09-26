module RoomsHelper
  def accepted?(user_id, room_id)
    current_user.room_users.where(room_id: room_id).exists?
  end
end
