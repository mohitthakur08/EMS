# frozen_string_literal: true

class Api::V1::LeavesController < ApplicationController
  before_action :find_leave_id, only: %i[approve_leave reject_leave]

  def create
    @leave = User.new(leave_params)
    render json: @leave if @leave.save
  end

  def index
    @leaves = Leave.all
    render json: @leaves
  end

  def update; end

  def approve_leave
    @leave = find_leave_id
    @leave.update(status: 1)
    flash[:notice] = 'Leave Approved'
    redirect_to leaves_path(@leave)
  end

  def reject_leave
    @leave = find_leave_id
    @leave.update(status: 2)
    flash[:notice] = 'Leave Rejected'
    redirect_to leaves_path(@leave)
  end

  private

  def leave_params
    params.require(:leave).permit(:leave_from, :leave_to, :leave_mail_to, :leave_reason, :user_id, :manager_id)
  end

  def find_leave_id
    Leave.find(params[:id])
  end
end
