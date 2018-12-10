class UsersController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ['User successfully created']
      flash[:notice] = ["Welcome, #{@user.name}"]
      session[:user_id] = @user.id
      redirect_to action: 'show', id: @user.id
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to action: 'new'
    end
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
