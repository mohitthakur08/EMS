class ProjectsController < ApplicationController
  def new
    project = current_user.projects.new(project_params)
  end

  def create
    project.save
  end
  
  def manager_name
    manager=User.where(manager_id:current_user.manager_id)
    manager_name =  manager.pluck(:first_name,:last_name)
  end



  private
    def project_params
      params.require(:project).permit(:project_name, :status, :task,)
    end
end
