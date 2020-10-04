class InputResultController < ApplicationController

  def show
    @user = User.find(params[:id])
    tweets = Tweet.where(user_id: params[:id]).sort do |a,b| a[:record_date] <=> b[:record_date] end
    diaries = Diary.where(user_id: params[:id])

    @input_results = []
    tweets.each do |tweet|
      tmp_diaries = diaries.where(record_date: tweet.record_date)
      if tmp_diaries.present?
        @input_results << [tweet, tmp_diaries]
      else
        @input_results << [tweet]
      end
    end

  end

end
