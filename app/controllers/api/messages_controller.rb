class Api::MessagesController < ApplicationController
  def index
    mission = Mission.find(params[:mission_id])
    last_message_id = params[:id].to_i
    @messages = mission.messages.includes(:user).where("id > ?", last_message_id)
  end
end
