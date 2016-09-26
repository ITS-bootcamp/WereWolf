class RoomsController < ApplicationController
  def index
    @rooms = Room.order(id: :desc).limit(10)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
