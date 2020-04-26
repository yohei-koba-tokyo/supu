require 'rails_helper'
describe MissionsController do
  context "when sign out" do
    describe 'GET #index' do
      it "http access success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it "redirect to new_user_session" do
        mission = create(:mission)
        get :show, params: { id: mission }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #new' do
      it "redirect to new_user_session" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it "redirect to new_user_session" do
        mission_params = attributes_for(:mission)
        post :create, params: { mission: mission_params }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it "redirect to new_user_session" do
        mission = create(:mission)
        get :edit, params: { id: mission }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      let!(:mission) { create(:mission) }
      it "redirect to new_user_session" do
        mission_params = attributes_for(:mission, name: "bbbbbbb")
        patch :update, params: { id: mission.id, mission: mission_params }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      let!(:mission) { create(:mission) }
      it "" do
        delete :destroy, params: { id: mission.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  context "when sign in" do
    let(:user) { create(:user) }
    before do
      login user
    end
    describe 'GET #index' do
      it "http access success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it "is expected to render template matcher show" do
        mission = create(:mission)
        get :show, params: { id: mission }
        expect(response).to render_template :show
      end
      it "is expected to eq @mission" do
        mission = create(:mission)
        get :show, params: { id: mission }
        expect(assigns(:mission)).to eq mission
      end
    end

    describe 'GET #new' do
      it "is expected to render template matcher new" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      it "is expected to change `Mission.count` by 1" do
        friend = create(:friend)
        mission_params = attributes_for(:mission, friend_id: friend.id)
        expect do
          post :create, params: { mission: mission_params }
        end.to change(Mission, :count).by(1)
      end
      it "is expected to redirect to /" do
        friend = create(:friend)
        mission_params = attributes_for(:mission, friend_id: friend.id)
        post :create, params: { mission: mission_params }
        expect(response).to redirect_to root_path
      end
      it "is expected to render template matcher new" do
        friend = create(:friend)
        mission_params = attributes_for(:mission)
        post :create, params: { mission: mission_params }
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it " is expected to eq @mission" do
        friend = create(:friend)
        mission = create(:mission, friend_id: friend.id)
        get :edit, params: { id: mission }
        expect(assigns(:mission)).to eq mission
      end
    end

    describe 'PATCH #update' do
      let!(:mission) { create(:mission) }
      it "is expected to eq new mission name" do
        mission_params = attributes_for(:mission, name: "NewMission", user_ids: [user.id])
        patch :update, params: { id: mission.id, mission: mission_params }
        mission.reload
        expect(mission.name).to eq "NewMission"
      end
      it "is expected to redirect to original mission page" do
        mission_params = attributes_for(:mission, name: "NewMission", user_ids: [user.id])
        patch :update, params: { id: mission.id, mission: mission_params }
        mission.reload
        expect(response).to redirect_to mission_path
      end
      it "expected to render template matcher edit" do
        mission_params = attributes_for(:mission, name: "NewMissionbutOverCharacter...", user_ids: [user.id])
        patch :update, params: { id: mission.id, mission: mission_params }
        mission.reload
        expect(response).to render_template :edit
      end
    end
    describe 'DELETE #destroy' do
      let!(:mission) { create(:mission) }
      it "is expected to change `Mission.count` by -1" do
        expect do
          delete :destroy, params: { id: mission.id }
        end.to change(Mission, :count).by(-1)
      end
    end
  end
end
