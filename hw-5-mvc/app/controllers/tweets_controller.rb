# frozen_string_literal: true

class TweetsController < ApplicationController
  def index
    # @tweets = current_user.tweets
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def show
    @tweet = Tweet.find_by(id: params[:id])
    @user = current_user
    @comments = @tweet.comments
    if @tweet.nil?
      render plain: "Tweet not found", status: :not_found
    end
  end
  # def show
  #   @tweet = Tweet.find_by(id: params[:id])
  #   if @tweet
  #     @comments = @tweet.comments.includes(:user).order(created_at: :desc)
  #     @comment = @tweet.comments.new
  #   else
  #     redirect_to tweets_path, alert: "Tweet not found."
  #   end
  # end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to root_path,
                  flash: { notice: 'Tweet was successfully created.' }
    else
      redirect_to root_path,
                  flash: { error: @tweet.errors.full_messages.to_sentence }
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end


end
