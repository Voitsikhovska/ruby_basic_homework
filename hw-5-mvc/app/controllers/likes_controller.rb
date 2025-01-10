class LikesController < ApplicationController
  before_action :set_tweet

  def create
    like = current_user.likes.new(tweet: @tweet)

    if like.save
      flash[:notice] = "You liked the tweet."
    else
      flash[:alert] = "Unable to like the tweet."
    end

    redirect_to root_path
  end

  def destroy
    like = current_user.likes.find_by(tweet: @tweet)

    if like&.destroy
      flash[:notice] = "You unliked the tweet."
    else
      flash[:alert] = "Unable to unlike the tweet."
    end

    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
