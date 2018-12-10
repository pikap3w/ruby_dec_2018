class SessionsController < ApplicationController
  # Render login page
  def new; end

  # Log User In
  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to controller: 'users', action: 'show', id: user.id
    else
      flash[:notice] = ['Invalid Combination']
      redirect_to action: 'new'
    end
    # if authenticate true
    # save user id to session
    # redirect to users profile page
    # if authenticate false
    # add an error message -> flash[:errors] = ["Invalid"]
    # redirect to login page
  end

  # Log User out
  def destroy
    # set session[:user_id] to null
    session[:user_id] = nil
    # redirect to login page
    redirect_to action: 'new'
  end
end
