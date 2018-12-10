require 'rails_helper'
RSpec.describe UsersController do
  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :show, params: { id: user.id }
      assigns(:user).to eq(user)
    end
    it 'renders the :show template' do
      user = create(:user)
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end
  end
  describe 'POST #create' do
    post :create, user: build(:user)
    expect(response).to eq("/users/#{User.last.id}")
  end
  describe 'PATCH #update' do
    user = create(:user)
    patch :update, params: { id: user, user: build(:user, name: 'Different Name') }
    user.reload
    expect(user.name).to eq('Different Name')
  end
  describe 'DELETE #destroy' do
    user = create(:user)
    delete :destroy, params: { id: user }
    expect(response).to be_success
  end
end
