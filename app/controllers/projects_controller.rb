class ProjectsController < ApplicationController
  def new
    @project= Project.new
  end

  def create
    @project=Project.new(project_params)
    @project.save
    redirect_to root_path
  end

  def assign_project
    user = User.find(params[:user_id])
    project_id=Project.find(params[:project_id])
    user.projects<<project_id
    redirect_to users_index_path
  end
  def unassign_project
    redirect_to users_index_path
  end
  def index
    @users = User.all
    @projects =Project.all
  end

  private
    def project_params
      params.require(:project).permit(:project_name, :status, :manager_id)
    end
end
