class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    @count = Like.group(:secret_id).count
  end

  def create
    # @secret        = Secret.create(content: params[:secret][:content], user: current_user)
    @secret        = Secret.create(secret_params)
    flash[:notice] = @secret.errors.full_messages if @secret.errors.full_messages.any?
    redirect_to current_user
  end

  def destroy
    Secret.destroy(params[:id])
    redirect_to current_user
  end

  private

  def secret_params
    params[:secret][:user_id] = session[:user_id]
    params.require(:secret).permit(:content, :user_id)
  end


end
