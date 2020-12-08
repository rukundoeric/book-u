class OpinionsController < ApplicationController
  before_action :require_login
  LIMIT_PER_LOAD = 5

  def index
    @opinions ||= []
    @opinions += Opinion.offset(offset).limit(LIMIT_PER_LOAD)
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @post.save
    redirect_to request.referer
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end

  def offset
    page = params.fetch(:page, 0).to_i
    page * LIMIT_PER_LOAD
  end
end
