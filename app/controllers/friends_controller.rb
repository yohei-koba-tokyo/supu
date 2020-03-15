class FriendsController < ApplicationController


  def index
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to friends_path
    else
      render 'new'
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend =Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to friend_path
    else
      render :edit
    end
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
