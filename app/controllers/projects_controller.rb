class ProjectsController < ApplicationController
  def create
    project = Project.new(project_params)

    if project.save
      redirect_to user_path(current_user.id)
    else
      # TODO:処理
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :limit_date).merge(user_id: current_user.id)
  end
end
