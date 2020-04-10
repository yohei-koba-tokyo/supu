class MissionsController < ApplicationController
  def index
    birthday_list
  end

  def show
    @mission = Mission.find(params[:id])
    @messages = @mission.messages.includes(:user)
    @message = Message.new
    gon.current_id = current_user.id
  end

  def new
    @mission = Mission.new
    @mission.users << current_user
    @mission.friend_id = params[:friend_id]
    @friends = Friend.select { |friend| friend.user_id == current_user.id }
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to root_path
    else
      @friends = Friend.select { |friend| friend.user_id == current_user.id }
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    @friends = []
    @friends << Friend.find(@mission.friend_id)
  end

  def update
    @mission = Mission.find(params[:id])
    return redirect_to mission_path(params[:id]) if @mission.update(mission_params)

    @friends = []
    @friends << Friend.find(@mission.friend_id)
    render :edit
  end

  private

  def mission_params
    params.require(:mission).permit(:datetime, :name, :comment, :mission_type, :friend_id, user_ids: [])
  end
end
