class PostsController < ApplicationController
  LIMIT_POSTS_PER_LOAD = 5

  def index
    @posts ||= []
    @posts += Post.offset(offset).limit(LIMIT_POSTS_PER_LOAD)
  end

  def create
    @post = current_user.posts.build(post_params)
    flash[:alert] = 'SOMETHING WENT WRONG!' unless @post.save
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def offset
    page = params.fetch(:page, 0).to_i
    page * LIMIT_POSTS_PER_LOAD
  end
end
