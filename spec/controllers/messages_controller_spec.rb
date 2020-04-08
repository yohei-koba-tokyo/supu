require 'rails_helper'
describe MessagesController do
  describe 'POST #create' do
    context "when sign out" do
      let(:mission) { create(:mission) }
      it 'redirect to new_user_session' do
        message_params = attributes_for(:message)
        post :create, params: { message: message_params, mission_id: mission.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
    context "when sign in" do
      let(:user) { create(:user) }
      before do
        login user
      end
      let(:mission) { create(:mission) }
      it "saves the new contact in the database" do
        message_params = attributes_for(:message)
        expect do
          post :create, params: { message: message_params, mission_id: mission.id }
        end.to change(Message, :count).by(1)
      end
      it "render to mission_path" do
        message_params = attributes_for(:message)
        post :create, params: { message: message_params, mission_id: mission.id }
        expect(response).to redirect_to mission_path(mission)
      end

      it "not saves the new contact in the database when error" do
        message_params = attributes_for(:message, content: nil, image: nil)
        expect do
          post :create, params: { message: message_params, mission_id: mission.id }
        end.not_to change(Message, :count)
      end
      it "redirect to mission_path when error" do
        message_params = attributes_for(:message, content: nil, image: nil)
        post :create, params: { message: message_params, mission_id: mission.id }
        expect(response).to redirect_to mission_path(mission)
      end
    end
  end
end
