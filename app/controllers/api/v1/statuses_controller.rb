# frozen_string_literal: true

class Api::V1::StatusesController < ApplicationController
  
  def index
    @status = Status.all
    render json: @status
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      render json: @status
    end
  end


  private

  def status_params
    params.require(:status).permit(:project_name, :total_hours, :task, :user_id, :manager_id)
  end
end
