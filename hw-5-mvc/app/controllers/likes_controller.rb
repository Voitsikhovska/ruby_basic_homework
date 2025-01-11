class LikesController < ApplicationController
  before_action :set_likable, only: :create

  def create
    @likable = params[:likable].safe_constantize.find(params[:likable_id])
    @like = @likable.likes.build(user: current_user)

    if @like.save
      flash[:notice] = "Liked successfully."
    else
      flash[:alert] = "Unable to like."
    end

    redirect_back(fallback_location: root_path)
  end


  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
      flash[:notice] = "Disliked successfully."
    else
      flash[:alert] = "Unable to dislike."
    end

    redirect_back(fallback_location: root_path)
  end


  private

  def set_likable
    klass = params[:likable].safe_constantize
    raise ActionController::BadRequest, "Invalid likable type" unless klass

    @likable = klass.find(params[:likable_id])
  end
end
