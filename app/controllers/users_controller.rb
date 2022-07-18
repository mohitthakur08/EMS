class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(new_user_params)
    redirect_to root_path if @user.save
  end

  def index
    @users = User.page params[:page]
    @projects = Project.all
    @project_id = params[:id]
  end
  
  

  def add_new_user
    @user = User.new
  end

  private

  def new_user_params
    params.require(:user).permit(:first_name, :email, :password,  )
  end
  
 

  # def user_params
  #   params.require(:user).permit(:first_name, :email, :password )
  # end
end
