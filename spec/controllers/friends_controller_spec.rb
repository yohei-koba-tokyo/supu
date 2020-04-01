# GETは、index, new, edit, show

require 'rails_helper'
describe FriendsController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested friend to @friend" do
      friend = create(:friend)
      get :edit, params: { id: friend }
      expect(assigns(:friend)).to eq friend
    end

    it "renders the :edit template" do
      friend = create(:friend)
      get :edit, params: { id: friend }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns requested friend to @friend " do
      friend = create(:friend)
      get :show, params: { id: friend }
      expect(assigns(:friend)).to eq friend
    end
    it "renders the :show template" do
      friend = create(:friend)
      get :show, params: { id: friend }
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
  let(:user) { create(:user) }
    before do
      login user
    end
    it "saves the new contact in the database" do
      friend_params = attributes_for(:friend)
      binding.pry
      expect{
        post :create, params: { friend: friend_params }
      }.to change(Friend, :count).by(1)
    end
    it "renders the :index template" do
      friend_params = attributes_for(:friend)
      post :create, params: { friend: friend_params }
      expect(response).to redirect_to friends_path
    end
  end


end