class ChartsController < ApplicationController
  def show
    # スタック棒グラフ 1習慣 ここから
    @all_select_time = OwnTime.all

    base_day = Date.today

    if select_time_params != nil
      select_time = OwnTime.find(select_time_params)
      week_array = []
      statistics_select_time_week = []
      tmp_result_time = ResultTime.where(user_id: current_user.id).where(own_time_id: select_time)
      (0..6).reverse_each do |i|
        week_array << base_day - i
        statistics_select_time_week << tmp_result_time.where(record_date: base_day - i).count/4.to_f
      end
      gon.label = week_array
      gon.statistics_select_time_week = statistics_select_time_week
      gon.title = select_time.name
    else
      gon.label = [1,2]
      gon.statistics_select_time_week = [3,4]
      gon.title = "睡眠時間にしたいのだが"
    end
    # スタック棒グラフ 1習慣 ここまで

  end

  private
  def select_time_params
    params[:select_time_0]
  end
end
