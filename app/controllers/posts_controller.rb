class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @comment = Comment.new
    # @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new      # フォーム用のインスタンス作成(コメント追加用)
    @comments = @post.comments  # コメント一覧表示用
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :shop_name, :post_image, :body, :rate, :area_id)
  end

end
