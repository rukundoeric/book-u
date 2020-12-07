class SessionsController < ApplicationController
  before_action :initialize_user, only: %i[new create]

  def new;end

  def create
    @user = User.find_by(username: params[:username])

    if @user
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'LOGGED IN SUCCESSFULLY!'
    else
      @errors << 'INVALID USER!'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'LOGGED OUT SUCCESSFULLY!'
  end

  private

  def initialize_user
    @errors ||= []
    @user = User.new
  end
end
