class ProjectsController < ApplicationController
  def create
    project = Project.new(project_params)

    if project.save
      flash[:success] = '作成しました'
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  def update
    project = Project.find(get_project_id)
    today = Date.today.to_time
    # done_flgを1（完了）にする
    if project.update(done_flg: 1, done_date: today)
      flash[:success] = '完了にしました'
      redirect_to user_path(current_user.id)
    else
      # TODO: 処理
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :limit_date).merge(user_id: current_user.id)
  end

  def get_project_id
    params[:project][:id]
  end
end
