require 'rails_helper'

feature 'user features' do

  feature ':: user sign-up' do
    before(:each) { visit '/users/new' }

    scenario ':: visits sign-up page' do
      expect(page).to have_field('user_name')
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_field('user_password_confirmation')
    end

    scenario ':: with improper inputs, redirects to sign in and shows validations' do
      register_user name: ''
      expect(page).to have_text("Name can't be blank")
      expect(current_path).to eq(new_user_path)
    end

    scenario ':: with proper inputs, creates user and redirects to login page' do
      register_user
      expect(current_path).to eq(new_session_path)
    end
  end

  feature ':: user dashboard' do
    # noinspection RubyBlockToMethodReference
    before do
      @user = create(:user)
      log_in
    end

    scenario ':: displays user information' do
      expect(page).to have_text(@user.name)
      expect(page).to have_link 'Edit Profile'
    end
  end
end
