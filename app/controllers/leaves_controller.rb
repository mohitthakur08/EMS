class LeavesController < ApplicationController
  before_action :find_leave_id, only: [:approve_leave, :reject_leave]
  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)
    if @leave.save
      flash[:notice] = 'Leave Request send'
      redirect_to leaves_path
    else
      flash[:alert] = "please fill all required field"
      redirect_to new_leafe_path
    end
  end

  def index
    @leave = Leave.all
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
    leave_id=Leave.find(params[:id])
    return leave_id
  end
end
