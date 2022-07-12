class StatusesController < ApplicationController

  def new
    @status = Status.new
  end
  
  def create
    @status=Status.new(status_params)
    @status.save
    redirect_to users_show_path
  end
  
  def index
    @status=Status.all
  end

  def daily_task
    @status=Status.find(params[:id])
  end

  
  private
    def status_params
      params.require(:status).permit(:project_name, :total_hours, :task ,:user_id, :manager_id)
    end
end
