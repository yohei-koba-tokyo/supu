require 'rails_helper'
describe FriendsController do

  context "when sign out" do

    describe 'GET #new' do
      it "redirect to new_user_session" do
        get :new
        expect(response).to redirect_to (new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it "redirect to new_user_session" do
        friend = create(:friend)
        get :edit, params: { id: friend }
        expect(response).to redirect_to (new_user_session_path)
      end
    end

    describe 'GET #index' do
      it "redirect to new_user_session" do
        get :index
        expect(response).to redirect_to (new_user_session_path)
      end
    end

    describe 'GET #show' do
      it "redirect to new_user_session" do
        friend = create(:friend)
        get :show, params: { id: friend }
        expect(response).to redirect_to (new_user_session_path)
      end
    end

    describe 'POST #create' do
      it "redirect to new_user_session" do
        friend_params = attributes_for(:friend)
        post :create, params: { friend: friend_params }
        expect(response).to redirect_to (new_user_session_path)
      end
    end  

    describe 'PATCH #update' do
      let!(:friend) { create(:friend)}
      it "redirect to new_user_session" do
        friend_params = attributes_for(:friend, name: "aaaaaa")
        patch :update, params: { id: friend.id, friend: friend_params }
        # friend.reload
        expect(response).to redirect_to (new_user_session_path)
      end
    end

  end

  context "when sign in" do

    let(:user) { create(:user) }
    before do
      login user
    end

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
      it "saves the new contact in the database" do
        friend_params = attributes_for(:friend)
        expect{
          post :create, params: { friend: friend_params }
        }.to change(Friend, :count).by(1)
      end
      it "render to friends_path" do
        friend_params = attributes_for(:friend)
        post :create, params: { friend: friend_params }
        expect(response).to redirect_to friends_path
      end
      it "renders the :new when error" do
        friend_params = attributes_for(:friend, name: "")
        post :create, params: { friend: friend_params }
        expect(response).to render_template :new
      end
    end  

    describe 'PATCH #update' do
      let!(:friend) { create(:friend, user_id: user.id)}
      it "update a friend" do
        friend_params = attributes_for(:friend, name: "Newname")
        patch :update, params: { id: friend.id, friend: friend_params }
        friend.reload
        expect(friend.name).to eq "Newname"
      end
      it "renders the :edit when error" do
        friend_params = attributes_for(:friend, name: "aaaaaaaa")
        patch :update, params: { id: friend.id, friend: friend_params }
        friend.reload
        expect(response).to render_template :edit
      end
    end
    
  end
end