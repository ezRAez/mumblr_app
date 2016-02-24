class CommentsController < ApplicationController
  before_action :authenticate
  before_action :authorize, only: [:destroy]

  def create
    mumble = Mumble.find params[:mumble_id]
    Comment.create mumble: mumble, user: current_user, text: params[:comment][:text]

    redirect_to mumble_path(mumble)
  end

  def destroy
    @comment.destroy
    redirect_to mumble_path(@mumble)
  end

  def authenticate
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def authorize
    @comment = Comment.find params[:id]
    @mumble = @comment.mumble
    unless @comment.user == current_user || @comment.mumble.user == current_user
      redirect_to mumble_path(@mumble)
    end
  end
end
