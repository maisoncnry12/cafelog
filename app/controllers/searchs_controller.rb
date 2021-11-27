class SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
  end
end
