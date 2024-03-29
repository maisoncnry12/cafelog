class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  # いいね一覧ページ表示するためのアクション
  def favorites
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites).page(params[:page]).per(8).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
