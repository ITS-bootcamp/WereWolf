class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.order(id: :desc).limit(10)
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room), flash: {notice: 'Roomを作成しました！'}
    else
      redirect_to action: 'new', flash: {alert: 'Roomが作成できませんでした、、、'}
    end
  end

  def create_room_user
    @room = Room.find(params[:id])
    @room_user = RoomUser.new(user_id: current_user.id, room_id: params[:id], role: 1)
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
