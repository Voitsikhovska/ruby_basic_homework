class CommentsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def edit
    @comment = Comment.find(params[:id])
    @comments = @comment.tweet.comments.includes(:user).order(created_at: :desc)
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated successfully."
      redirect_to root_path
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentence
      render :edit
    end
  end

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
  def set_comment
    @comment = Comment.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:content)
  end
  def authorize_user
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
