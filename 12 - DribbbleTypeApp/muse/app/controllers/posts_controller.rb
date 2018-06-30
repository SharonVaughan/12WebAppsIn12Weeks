class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @comments = Comment.where(post_id: @post)

    @random_post = Post.where.not(id: @post).order("RANDOM()").first
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create
    # @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    
    redirect_to root_path
  end

  def upvote
    @post.upvote_by current_user
    redirect_back fallback_location: @post
  end

  def downvote
    @post.downvote_by current_user
    redirect_back fallback_location: @post
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link, :description, :image)
  end
end
