class SessionsController < ApplicationController
  # Render login page
  def new; end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user # if authenticate == true:
      # save user id to session
      session[:user_id] = user.id
      # redirect to users profile page
      redirect_to controller: 'users', action: 'show', id: user.id
    else # if authenticate == false:
      # add an error message -> flash[:errors] = ["Invalid"]
      flash[:notice] = ['Invalid Combination']
      # redirect to login page
      redirect_to action: 'new'
    end
  end

  # Log User out
  def destroy
    # set session[:user_id] to null
    session[:user_id] = nil
    # redirect to login page
    redirect_to action: 'new'
  end
end
