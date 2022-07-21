# frozen_string_literal: true

class StatusesController < ApplicationController
  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      flash[:notice] = 'Status Uploades'
      redirect_to statuses_path
    else
      flash[:alert] = 'Please Fill all required fields'
      redirect_to new_status_path
    end
  end

  def index
    @status = Status.all
  end

  def daily_task
    @status = Status.find(params[:id])
  end

  private

  def status_params
    params.require(:status).permit(:project_name, :total_hours, :task, :user_id, :manager_id)
  end
end
