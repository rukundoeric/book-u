class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]
  before_action :initialize_user, only: %i[new]
  before_action :require_login, only: %i[index show update]

  def index
    @users = User.all
  end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'USER SUCCESSFULLY CREATED!'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'COVER PHOTO UPDATED SUCCESSFULLY!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def initialize_user
    @errors ||= []
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:fullname, :username, :photo, :cover)
  end
end
