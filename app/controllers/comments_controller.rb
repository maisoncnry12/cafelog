class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    @comment.save
    redirect_to post_path(@post.id)
  end
  
  # 非同期通信
  # def create
  #   @post = Post.find(params[:post_id])
  #   @comment = Comment.new(comment_params)
  #   @comment.post_id = @post.id
  #   @comment.user_id = current_user.id
  #   @comment.save
  #   # app/views/comments/create.js.erbを参照する
  # end

  def destroy
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_to request.referer
  end
  
  # 非同期通信
  # def destroy
  #   @post = Post.find(params[:post_id])
  #   comment = @post.comments.find(params[:id])
  #   comment.destroy
  #   # app/views/comments/destroy.js.erbを参照する
  # end
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :comment)
  end

end