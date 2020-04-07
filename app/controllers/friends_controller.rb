class FriendsController < ApplicationController


  def index
    if user_signed_in?
      @thismonth = Date.today.month
      @nextmonth = Date.today.prev_month(-1).month
      @nextnextmonth = Date.today.prev_month(-2).month
      user_id = current_user.id
      @friends_thismonth = Friend.reorder(:day).select{ |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @thismonth }
      @friends_nextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextmonth }
      @friends_nextnextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextnextmonth }
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      @friend.update( day: @friend.birth.to_s.match(/..$/)[0] )
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
      @friend.update( day: @friend.birth.to_s.match(/..$/)[0] )
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
