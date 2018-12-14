class LikesController < ApplicationController
  def create
    Like.create(user_id: session[:user_id], secret_id: params[:secret][:secret_id])
    redirect_to secrets_url
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy unless session[:user_id] != @like.user_id
    redirect_to secrets_url
  end
end
