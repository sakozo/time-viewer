class ResultTimesController < ApplicationController
  def create
    result_time = ResultTime.new(result_time_params)

    if result_time.save
      redirect_to user_path(current_user.id)
    else
      # TODO:処理
    end
  end

  private
  def result_time_params
    params.require(:result_time).permit(:own_time_id, :block, :record_date).merge(user_id: current_user.id)
  end
end
