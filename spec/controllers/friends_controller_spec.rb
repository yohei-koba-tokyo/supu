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
    # it "populates an array of friends" do
    #   friends = create_list(:friend, 5)
    #   get :index
    #   expect(assigns(:friends)).to match(friends)
    # end

    it "renders the :index template" do
    end
  end


end