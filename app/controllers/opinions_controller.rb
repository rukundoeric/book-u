class OpinionsController < ApplicationController
  before_action :require_login
  before_action :initialize_opinion

  def index
    @opinions = Opinion.where('author_id IN (?)', current_user.followings.ids << current_user.id)
      .eager_loading.ordered_by_most_recent
    @users_to_follow = User.where('id NOT IN (?)', current_user.followings.ids << current_user.id)
      .eager_loading.ordered_by_most_recent
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      send_notification('new_opinion')
    else
      flash[:alert] = 'SOMETHING WENT WRONG!'
    end
    redirect_to request.referer
  end

  private

  def initialize_opinion
    @opinion = Opinion.new
  end

  def opinion_params
    params.require(:opinion).permit(:text)
  end

end
