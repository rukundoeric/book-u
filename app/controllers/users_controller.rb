class UsersController < ApplicationController
  before_action :set_user, only: %i[ show, edit, update, destroy ]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to @user, notice: 'USER SUCCESSFULLY CREATED!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
