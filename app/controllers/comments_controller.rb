class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to transaction_agreement_path(@comment.product,@comment.product)
    else
      redirect_to products_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:product_id, :user_id, :comment)
  end
end
