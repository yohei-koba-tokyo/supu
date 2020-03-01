class FriendsController < ApplicationController


  def index
  end

  def new
    @friend = Friend.new
  end

  def create
    Friend.create(friend_params)
    redirect_to friends_path
  end

  def show
    @friend = Friend.find(params[:id])
    
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update

    friend =Friend.find(params[:id])
    friend.update(friend_params)
    redirect_to friends_path
  end


  def destroy
    friend = Friend.find(params[:id])
    friend.destroy
    redirect_to friends_path
  end


  private
    def friend_params
      params.require(:friend).permit(:name, :sex, :birth, :twitter, :memo).merge(user_id: current_user.id)
    end



end
