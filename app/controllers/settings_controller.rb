class SettingsController < ApplicationController
#  before_action :set_user
  def index
    @user = User.find(current_user.id)

    # フォローワーここから
    @followers = Relationship.where(follow_id: current_user.id, status: 0).includes(:user)
    # フォローワーここまで

    @users = User.all
  end

  # private
  # def set_currentuser
  #   @user=User.find(current_user.id)
  # end

end
