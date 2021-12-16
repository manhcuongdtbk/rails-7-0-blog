class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create! params.required(:comment).permit(:content)
    CommentsMailer.with(comment: comment).submitted.deliver_later
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
