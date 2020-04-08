class UsersController < ApplicationController
  def index
    return nil if params[:keyword] == ""

    @users = User.where(['nickname LIKE?', "%#{params[:keyword]}%"]).where.not(id: current_user.id).where.not(id: params[:member]).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
