class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
    @posts = Post.all
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to posts_path
    # @post = Post.find(params[:post_id])
    # favorite = @post.favorites.new(user_id: current_user.id)
    # favorite.save
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to posts_path
    # @post = Post.find(params[:post_id])
    # favorite = @post.favorites.find_by(user_id: current_user.id)
    # favorite.destroy
  end

  private
   def favorite_params
     params.require(:faborite).permit(:user_id, :post_id)
   end
end
