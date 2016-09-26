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

  def destroy
  end

  private
    def room_params
      params.require(:room).permit(:name, :author_id)
    end
end
