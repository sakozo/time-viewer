class OwnTimesController < ApplicationController
  def create
    own_time = OwnTime.new(own_time_params)

    if own_time.save
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  private

  def own_time_params
    params.permit(:name, :time_type, :shareFlg, :publicLevel).merge(user_id: current_user.id)
  end
end
