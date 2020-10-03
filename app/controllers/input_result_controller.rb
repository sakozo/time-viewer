class InputResultController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: params[:id])

  end

end
