class RoomsController < ApplicationController
  def index
    @rooms = Room.order(id: :desc).limit(10)
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
  end

  def destroy
  end

  private
    def room_params
      params.require(:room).permit(:name, :author_id)
    end
end
