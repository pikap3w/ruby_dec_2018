require 'rails_helper'

feature 'user settings features' do
  # noinspection RubyBlockToMethodReference
  before(:each) do
    @user = create(:user)
    log_in
    click_link 'Edit Profile'
  end

  feature ':: dashboard' do

    scenario ':: visit users edit page' do
      expect(page).to have_field('user_name')
      expect(page).to have_field('user_email')
    end

    scenario ':: inputs filled out correctly' do
      expect(find_field('user_name').value).to eq(@user.name)
      expect(find_field('user_email').value).to eq(@user.email)
    end

    scenario ':: incorrectly updates information' do
      fill_in 'user_name', with: 'Another Name'
      fill_in 'user_email', with: 'incorrect email format'
      click_button 'Update'
      expect(current_path).to eq("/users/#{@user.id}/edit")
      expect(page).to have_text('Email is invalid')
    end

    scenario ':: correctly updates information' do
      fill_in 'user_name', with: 'Another Name'
      fill_in 'user_email', with: 'correct@email.com'
      click_button 'Update'
      expect(page).to have_text('Another Name')
    end

    scenario ':: destroys user and redirects to registration page' do
      click_button 'Delete Account'
      expect(current_path).to eq('/users/new')
    end
  end
end
