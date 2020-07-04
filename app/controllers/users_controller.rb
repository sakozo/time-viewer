class UsersController < ApplicationController
  def index
    
  end

  def show
    @user = User.find(params[:id])

    @own_time = OwnTime.new

    # TODO:天気自動記録機能の実装
    #環境変数をJSに渡す
    #gon.wheather_api_key = ENV['OPEN_WEATHER_API_KEY']
  end
end
