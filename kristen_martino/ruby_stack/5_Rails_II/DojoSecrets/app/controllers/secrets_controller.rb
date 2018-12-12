class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
    @user = current_user
  end

  def create
    @secret        = Secret.create(content: params[:secret][:content], user: current_user)
    flash[:notice] = @secret.errors.full_messages if @secret.errors.full_messages.any?
    redirect_to current_user
  end

  def destroy
    Secret.destroy(params[:id])
    redirect_to current_user
  end

  private

  def secret_params
    params.require(:secret).permit(:content, :user)
  end


end
