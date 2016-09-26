class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.order(id: :desc).limit(10)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      room_role = ['悪魔', '村人', '占い師'].shuffle.first
      @room.room_users.create(user_id: current_user.id, role: room_role)
      redirect_to room_path(@room), flash: {notice: 'Roomを作成しました！'}
    else
      redirect_to action: 'new', flash: {alert: 'Roomが作成できませんでした、、、'}
    end
  end

  def create_room_user
    @room = Room.find(params[:id])
    # 悪魔＝>0, 村人＝>1, 占い師＝>2
    room_roles = ['悪魔', '村人', '占い師']
    if RoomUser.where(room_id: params[:id]).exists?
      room_users = RoomUser.where(room_id: params[:id]).group(:role)
      if room_users.where(role: '悪魔').exists?
        room_roles = ['村人', '占い師']
      elsif room_users.where(role: '占い師').exists?
        room_roles = ['村人']
      end
    end
    room_role = room_roles.shuffle.first
    @room_user = RoomUser.new(user_id: current_user.id, room_id: params[:id], role: room_role)
    if @room_user.save
      redirect_to room_path(params[:id]), flash: {notice: "#{@room.name}のメンバーになりました！"}
    else
      redirect_to room_path(params[:id]), flash: {notice: "#{@room.name}に参加できませんでした、、、"}
    end
  end

  private
    def room_params
      params.require(:room).permit(:name, :author_id)
    end
end
