class SettingsController < ApplicationController
  #  before_action :set_user
  def index
    @user = User.find(current_user.id)

    # フォローワーここから
    @request_followers = Relationship.where(follow_id: current_user.id, status: 0).includes(:user)
    @followers = Relationship.where(follow_id: current_user.id, status: 1).includes(:user)
    # フォローワーここまで

    @users = User.all

    all_tweets = Tweet.all
    @tweets = []
    if user_signed_in?
      all_tweets.each do |tweet|
        @tweets << tweet if current_user.check_following?(tweet.user_id) || (current_user.id == tweet.user_id)
      end
    end
  end

  # private
  # def set_currentuser
  #   @user=User.find(current_user.id)
  # end
end
