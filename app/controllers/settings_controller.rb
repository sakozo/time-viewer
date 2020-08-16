class SettingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @project = Project.new

    @all_select_time = OwnTime.all
    @select_time1 = OwnTime.where(time_type: 1)
    @select_time2 = OwnTime.where(time_type: 2)
    @select_time3 = OwnTime.where(time_type: 3)
    @select_time4 = OwnTime.where(time_type: 4)

    # colorここから
    if UserColor.find_by(user_id: current_user.id).present?
      # 色が登録済みの場合
      @user_color = UserColor.find_by(user_id: current_user.id)
      colors = @user_color.colors.split(':')
      @initial_value1 = colors[0]
      @initial_value2 = colors[1]
      @initial_value3 = colors[2]
      @initial_value4 = colors[3]
    else
      # 未登録の場合はデフォルト初期値をViewに渡す
      @user_color = UserColor.new
      @initial_value1 = '#ff0000'
      @initial_value2 = '#0000ff'
      @initial_value3 = '#00ff00'
      @initial_value4 = '#ffff00'
    end
    # colorここまで
  end
end
