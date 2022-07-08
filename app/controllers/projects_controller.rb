class ProjectsController < ApplicationController
  def new
    @project= Project.new
  end

  def create
    @project=Project.new(project_params)
    @project.save
    redirect_to root_path
  end
  def index
    @users = User.all
    @projects =Project.all
  end

  private
    def project_params
      params.require(:project).permit(:project_name, :status,:user_id, :manager_id)
    end
end
