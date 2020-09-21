class OwnTimesController < ApplicationController
  def create
    own_time = OwnTime.new(own_time_params)

    if own_time.save
      flash[:success] = '時間の登録を行いました'
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  private

  def own_time_params
    params.permit(:name, :time_type, :shareFlg, :publicLevel, :task_flg, :estimated_time).merge(user_id: current_user.id)
  end
end
