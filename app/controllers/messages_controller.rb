class MessagesController < ApplicationController


  def create
    @message = Message.create(message_params)
    mission = Mission.find(params[:mission_id])
    redirect_to mission_path(mission)
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, mission_id: params[:mission_id])
  end
end
