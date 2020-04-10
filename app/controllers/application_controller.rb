class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def birthday_list
    return unless user_signed_in?

    @thismonth = Date.today.month
    @nextmonth = Date.today.prev_month(-1).month
    @nextnextmonth = Date.today.prev_month(-2).month
    user_id = current_user.id
    @friends_thismonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @thismonth }
    @friends_nextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextmonth }
    @friends_nextnextmonth = Friend.reorder(:day).select { |friend| user_id == friend.user_id && friend.birth.present? && friend.birth.month == @nextnextmonth }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
