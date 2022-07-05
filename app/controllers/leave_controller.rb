class LeaveController < ApplicationController
    def new
      @leave = Leave.new
    end
    
    def create
      @leave=Leave.new(leave_params)
      if @leave.save
        redirect_to root_url
      end
    end

    def update
    end
    private
      def leave_params
        params.require(:leave).permit(:leave_from, :leave_to, :leave_mail_to,:leave_reason ,:user_id, :manager_id)
      end
end
