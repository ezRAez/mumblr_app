class MumblesController < ApplicationController
  before_action :authenticate,      only: [:create, :destroy]
  before_action :authorize_create,  only: [:create]
  before_action :authorize_destroy, only: [:destroy]

  def index
    if params[:user_id]
      @user    = User.find(params[:user_id])
      redirect_to user_path(@user) if @user == current_user
      @mumbles = Mumble.search(params[:search]).where(user: @user)
    else
      @mumbles = Mumble.search params[:search]
    end
  end

  def show
    @mumble = Mumble.find(params[:id])
  end

  # nested route /users/:user_id/mumbles
  def create
    @mumble = @user.mumbles.build(mumble_params)

    if @mumble.save
      flash[:notice] = "You have created a new mumble!"

      if params[:redirect]
        redirect_to params[:redirect]
      else
        redirect_to mumble_path(@mumble)
      end
    else
      render :"users/show"
    end
  end

  def destroy
    @mumble.destroy
    redirect_to user_path(current_user)
  end

  private

    def mumble_params
      params.require(:mumble).permit(:text, :tags, :image_uri)
    end

    def authenticate
      redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
    end

    # nested route /users/:id/mumbles
    def authorize_create
      @user = User.find(params[:user_id])
      redirect_to root_path if @user != current_user
    end

    def authorize_destroy
      @mumble = Mumble.find(params[:id])
      redirect_to root_path if @mumble.user != current_user
    end
end
