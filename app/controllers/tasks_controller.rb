class TasksController < ApplicationController
  def index
    tasks = OwnTime.where(user_id: current_user.id).where(task_flg: 1)

    @doing_task_result_time_list = {}
    tasks.where(done_task_flg: 0).each do |task|
      task_count = ResultTime.where(own_time_id: task.id).count / 4.to_f
      @doing_task_result_time_list[task] = task_count
    end

    @done_task_result_time_list = {}
    tasks.where(done_task_flg: 1).each do |task|
      task_count = ResultTime.where(own_time_id: task.id).count / 4.to_f
      @done_task_result_time_list[task] = task_count
    end

  end

  def update
    task = OwnTime.find(get_task_id)
    today = Date.today.to_time
    # done_flgを1（完了）にする
    if task.update(done_task_flg: 1, done_date: today)
      redirect_to tasks_path
    else
      # TODO: 処理
    end
  end

  private
  def get_task_id
    params[:task_id]
  end

end
