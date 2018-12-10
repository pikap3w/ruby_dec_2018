require 'rails_helper'
module CapybaraHelpers
  def register_user(name: 'kristen', email: 'kristen@martino.com', password: 'password')
    visit new_user_path unless current_path == new_user_path
    fill_in 'user_name', with: name
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password
    click_button 'Create User'
  end
end
