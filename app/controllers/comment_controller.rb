class CommentController < ApplicationController
  before_action :authenticate_user!

  def index
    @room = Room.find(params[:room_id])
    @comments = Comment.where(room_id: params[:room_id]).order(id: :desc)
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(room_id: params[:room_id], user_id: current_user.id, content: params[:comment][:content])
    if @comment.save
      redirect_to room_comment_index_path(params[:room_id]), notice: 'コメントしました！'
    else
      redirect_to room_comment_index_path(params[:room_id]), notice: 'コメントできませんでした、、、'
    end
  end
end
