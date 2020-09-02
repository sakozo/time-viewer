class ChartsController < ApplicationController
  def show
    # 棒グラフ 1週間 ここから
    @all_select_time = OwnTime.all

    # 入力日を基準(base_day)に1週間前まで
    base_day = date_params.blank? ? Date.today : date_params.to_date

    # デフォルトで睡眠時間を表示する
    select_time_param = select_time_params.blank? ? select_time_param = 1 : select_time_params
    select_time = OwnTime.find(select_time_param)
    week_array = [] # 1週間の日付を格納
    statistics_select_time_week = [] # own_timeのブロック数 ÷ 4 (per時間)を格納
    tmp_result_time = ResultTime.where(user_id: current_user.id).where(own_time_id: select_time)
    (0..6).reverse_each do |i|
      week_array << base_day - i
      statistics_select_time_week << tmp_result_time.where(record_date: base_day - i).count / 4.to_f
    end
    gon.label = week_array
    gon.statistics_select_time_week = statistics_select_time_week
    gon.title = select_time.name
    end
  # 棒グラフ 1週間 ここまで

  private

  def select_time_params
    params[:select_time_0]
  end

  def date_params
    params[:date]
  end
end
