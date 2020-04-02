class FriendsController < ApplicationController


  def index
    @thismonth = Date.today.month
    @nextmonth = Date.today.prev_month(-1).month
    @nextnextmonth = Date.today.prev_month(-2).month

    if user_signed_in?
      user_id = current_user.id
    else
      user_id = -1
    end
    @friends_thismonth = Friend.select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @thismonth }
    @friends_nextmonth = Friend.select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextmonth }
    @friends_nextnextmonth = Friend.select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextnextmonth }
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
    friend =Friend.find(params[:id])
    if friend.update(friend_params)
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
