# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def new_employee
    @user = User.new
  end

  def create_employee
    @user = User.new(employee_params)
    if @user.save
      flash[:notice] = 'Employee Created'
    else
      flash[:alert] = 'please fill all required field'
    end
    redirect_to root_path
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
    params.require(:user).permit(:first_name, :email, :password)
  end

  def employee_params
    params.permit(:first_name, :email, :password)
  end
end
