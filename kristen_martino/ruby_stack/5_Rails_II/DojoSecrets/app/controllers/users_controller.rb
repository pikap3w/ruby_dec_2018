class UsersController < ApplicationController
  def index; end

  def new; end

  def create
    @user = User.create(user_params)
    if @user.errors.full_messages.any?
      flash[:notice] = @user.errors.full_messages
      redirect_to action: 'new'
    else
      flash[:notice] = ['User successfully created']
      flash[:notice] = ["Welcome, #{@user.name}"]
      session[:user_id] = @user.id
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def show
    id = params[:id]
    @user = User.find(id)
    @secrets = @user.secrets
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.errors.full_messages.any?
      flash[:notice] = @user.errors.full_messages
      redirect_to action: 'edit'
    else
      redirect_to @user
    end
  end

  def destroy
    User.destroy(params[:id])
    session[:user_id] = nil
    redirect_to action: 'new'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
