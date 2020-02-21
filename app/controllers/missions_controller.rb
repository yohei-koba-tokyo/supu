class MissionsController < ApplicationController

  def new
    @mission = Group.new
    @mission.users << current_user
  end

  def create
    binding.pry
  end


end
