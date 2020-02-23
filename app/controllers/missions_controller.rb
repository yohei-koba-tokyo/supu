class MissionsController < ApplicationController

  def index
    @missions = Mission.all
  end

  def new
    @missions = Mission.all
    @mission = Mission.new
    # @mission.users << current_user
  end

  def create
  end


end
