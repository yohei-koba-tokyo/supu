class FriendsController < ApplicationController


  def index
  end

  def new
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def edit
    @friend = Friend.find(params[:id])
  end




end
