require 'rails_helper'
module CapybaraHelpers
  def log_in(email: 'kristen@martino.com', password: 'password')
    visit '/sessions/new' unless current_path == '/sessions/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log In'
  end
end