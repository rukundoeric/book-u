class OpinionsController < ApplicationController
  before_action :require_login
  before_action :initialize_opinion
  LIMIT_PER_LOAD = 5

  def index
    @opinions = Opinion.where('author_id IN (?)', current_user.followings.ids << current_user.id)
      .offset(offset).limit(LIMIT_PER_LOAD).ordered_by_most_recent
    @users_to_follow = User.where('id NOT IN (?)', current_user.followings.ids << current_user.id)
      .ordered_by_most_recent
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @opinion.save
    send_notification('new_opinion')
    redirect_to request.referer
  end

  private

  def initialize_opinion
    @opinion = Opinion.new
  end

  def opinion_params
    params.require(:opinion).permit(:text)
  end

  def offset
    @page = params.fetch(:page, 0).to_i
    @page * LIMIT_PER_LOAD
  end
end
