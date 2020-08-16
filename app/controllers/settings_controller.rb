class SettingsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @project = Project.new

    @all_select_time = OwnTime.all
    @select_time1 = OwnTime.where(time_type: 1)
    @select_time2 = OwnTime.where(time_type: 2)
    @select_time3 = OwnTime.where(time_type: 3)
    @select_time4 = OwnTime.where(time_type: 4)
  end
end
