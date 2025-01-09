# frozen_string_literal: true

class TweetsController < ApplicationController
  def show
    @tweet = Tweet.find_by(id: params[:id])
    if @tweet
      render inline: <<-ERB
        <h1><%= @tweet.content %></h1>
        <p>Posted by: <%= @tweet.user.user_profile.first_name %> <%= @tweet.user.user_profile.last_name %> (@<%= @tweet.user.user_profile.username %>)</p>
        <h2>Comments</h2>
        <% if @tweet.comments.any? %>
          <% @tweet.comments.each do |comment| %>
            <p>
              <strong><%= comment.user.user_profile.username %></strong>: <%= comment.content %>
            </p>
          <% end %>
        <% else %>
          <p>No comments yet.</p>
        <% end %>
        <h4>Add a comment</h4>
        <%= form_with model: [@tweet, Comment.new], local: true do |f| %>
          <div class="form-group">
            <%= f.label :content, "Your Comment" %>
            <%= f.text_area :content, rows: 3, class: "form-control" %>
          </div>
          <div class="form-group">
            <%= f.submit "Post Comment", class: "btn btn-primary" %>
          </div>
        <% end %>
      ERB
    else
      redirect_to tweets_path, alert: "Tweet not found."
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
