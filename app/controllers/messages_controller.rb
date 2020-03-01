class MessagesController < ApplicationController

  def create
    mission = Mission.find(params[:mission_id])
    @message = Message.create(message_params)
    if @message.save 
      respond_to do |format|
        format.html { redirect_to mission_path(mission) }
        format.json 
      end
    else
      @messages = @mission.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render mission_path(mission)
    end
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id, mission_id: params[:mission_id])
  end
end
