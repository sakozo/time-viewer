class InputResultController < ApplicationController
  before_action :check_following_user?, only: [:show]
  def show
    @user = User.find(params[:id])
    tweets = Tweet.where(user_id: params[:id]).sort { |a, b| a[:record_date] <=> b[:record_date] }
    diaries = Diary.where(user_id: params[:id])

    @input_results = []
    tweets.each do |tweet|
      tmp_diaries = diaries.where(record_date: tweet.record_date)
      @input_results << if tmp_diaries.present?
                          [tweet, tmp_diaries]
                        else
                          [tweet]
                        end
    end
  end

  private

  def check_following_user?
    if current_user.check_following?(params[:id]) || (current_user.id == params[:id].to_i)
    else
      redirect_to root_path
    end
  end
end
