# frozen_string_literal: true

class Api::V1::ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render json: @projects
  end

  def create
    @project = User.new(project_params)
    render json: @project if @project.save
  end

  def assign_project
    user = User.find(params[:user_id])
    project_id = Project.find(params[:project_id])
    flash[:notice] = 'project assign' if user.projects << project_id
  end

  def unassign_project
    redirect_to users_index_path
  end

  def index
    @users = User.all
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:project_name, :status, :manager_id)
  end
end
