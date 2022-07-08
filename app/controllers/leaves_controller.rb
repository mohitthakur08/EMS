class LeavesController < ApplicationController
  def new
    @leave = Leave.new
  end
    
  def create
    @leave=Leave.new(leave_params)
    @leave.save    
    redirect_to leaves_path
    flash[:notice] = "Leave Request send"
  end

  def index
    @leave =Leave.all
  end

  def update
  end

  def approve_leave
    @leave = Leave.find(params[:id])
    @leave.update(status: 1)
    flash[:notice] = "Leave Approved"
    redirect_to leaves_path(@leave)
  end
    
  def reject_leave
    @leave = Leave.find(params[:id])
    @leave.update(status: 2)
    flash[:notice] = "Leave Rejected"
    redirect_to leaves_path(@leave)
  end
  
  private
    def leave_params
      params.require(:leave).permit(:leave_from, :leave_to, :leave_mail_to,:leave_reason ,:user_id, :manager_id)
    end
end
