class FriendsController < ApplicationController
  def index
    return redirect_to new_user_session_path if current_user.blank?

    birthday_list
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      @friend.update(day: @friend.birth.to_s.match(/..$/)[0])
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
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      @friend.update(day: @friend.birth.to_s.match(/..$/)[0])
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
