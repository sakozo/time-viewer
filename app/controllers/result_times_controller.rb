class ResultTimesController < ApplicationController
  def create
    error_flg = false

    block_params.each do |block|
      data = result_time_params.merge(block: block[0]).merge(own_time_id: block[1])
      #data = data.merge(own_time_id: block[1])
      result_time = ResultTime.new(data)
      unless result_time.save
        error_flg = true
      end
    end

    if error_flg
      # TODO:処理
    else
      redirect_to user_path(current_user.id)
    end

  end

  private
  def result_time_params
    params.require(:result_time).permit(:record_date).merge(user_id: current_user.id)
  end
  
  def block_params
    params.require(:block)[0]
  end
end
