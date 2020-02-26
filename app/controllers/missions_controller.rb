class MissionsController < ApplicationController

  def index
  end

  def new
    @mission = Mission.new
    @mission.users << current_user
    @friends = []
    Friend.all.each do |friend|
      if friend.user_id == current_user.id
        @friends << friend
      end
    end
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end


  private
  def mission_params
    params.require(:mission).permit(:datetime, :name, :comment, :mission_type, :friend_id, user_ids: [])
  end

end
