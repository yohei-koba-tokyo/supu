class MissionsController < ApplicationController

  def index
    @thismonth = Date.today.month
    @nextmonth = Date.today.prev_month(-1).month
    @nextnextmonth = Date.today.prev_month(-2).month
    if user_signed_in?
      user_id = current_user.id
    else
      user_id = -1
    end
    @friends_thismonth = Friend.reorder(:day).select{ |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @thismonth }
    @friends_nextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextmonth }
    @friends_nextnextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextnextmonth }
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
    @friends = Friend.select{ |friend| friend.user_id == current_user.id }
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      @friends = Friend.select{ |friend| friend.user_id == current_user.id }
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
    if @mission.update(mission_params)
      redirect_to mission_path(params[:id]), notice: 'グループを更新しました'
    else
      @friends = []
      @friends << Friend.find(@mission.friend_id)
      render :edit
    end
  end


  private
  def mission_params
    params.require(:mission).permit(:datetime, :name, :comment, :mission_type, :friend_id, user_ids: [])
  end

end
