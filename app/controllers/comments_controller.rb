class CommentsController < ApplicationController
  def create
    # Comment.create(comment_params)
    # redirect_to root_path
    # item_comments_path(comment.item.id)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item.id)
    else
      redirect_to item_path(@comment.item.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user&.id , seller_id: current_seller&.id,item_id: params[:item_id])
  end
end
# , seller_id: current_seller&.id,