class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def new_employee
    @employee=User.new
  end

  def create_employee
    byebug
    @employee=User.new(employee_params)
    if @employee.save
      flash[:notice] = 'Employee Created'
      redirect_to root_path
    else
      flash[:alert] = "please fill all required field"
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    redirect_to root_path if @user.save
  end

  def index
    @users = User.page params[:page]
    @projects = Project.all
    @project_id = params[:id]
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :email, :password )
  end

  def employee_params
    params.require(:employee).permit(:first_name, :email, :password)
  end
end
