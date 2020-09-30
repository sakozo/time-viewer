class TasksController < ApplicationController
  before_action :set_currentuser
  def index
    tasks = OwnTime.where(user_id: current_user.id).where(task_flg: 1)

    @task_result_time_list = {}
    # 逆ループで新しいものが上にくるようにする
    tasks.reverse_each do |task|
      task_count = ResultTime.where(own_time_id: task.id).count / 4.to_f
      @task_result_time_list[task] = task_count
    end

    # own_timeの選択肢を設定
    @all_select_time = OwnTime.all
    @select_time1 = OwnTime.where(time_type: 1)
    @select_time2 = OwnTime.where(time_type: 2)
    @select_time3 = OwnTime.where(time_type: 3)
    @select_time4 = OwnTime.where(time_type: 4)

  end

  def update
    task = OwnTime.find(get_task_id)
    today = Date.today.to_time

    if task.done_task_flg == 0
      # done_flgを1（完了）にする
      if task.update(done_task_flg: 1, done_date: today)
        flash[:success] = '完了にしました'
        redirect_to tasks_path
      else
        # TODO: 処理
      end
    else
      # done_flgを0（取り組み中）にする
      if task.update(done_task_flg: 0, done_date: nil)
        flash[:success] = '取り組み中にしました'
        redirect_to tasks_path
      else
        # TODO: 処理
      end
    end
  end

  private

  def get_task_id
    params[:task_id]
  end

  def set_currentuser
    @user=User.find(current_user.id)
  end

end
