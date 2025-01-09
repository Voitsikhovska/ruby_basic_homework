class CommentsController < ApplicationController
  before_action :set_tweet

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    @tweet = @comment.tweet # Знаходимо твіт, щоб повернутися на ту ж сторінку
    @comment.destroy

    flash.now[:notice] = "Comment deleted successfully."
    @comments = @tweet.comments.includes(:user).order(created_at: :desc)
    redirect_to root_path

  end
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      flash.now[:notice] = "Comment added successfully."
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentence
    end

    @comments = @tweet.comments.includes(:user).order(created_at: :desc) # Оновлюємо список коментарів
    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
