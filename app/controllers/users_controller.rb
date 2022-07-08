class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  
  def show
  end
  
  def create
    
    @user=User.new(new_user_params)
    if @user.save
      redirect_to root_path
    end
  end

 

  def index
    @users = User.all
    @projects =Project.all
  end

  def add_new_user
    
    @user = User.new
  end

  private
    def new_user_params
      params.require(:user).permit(:first_name, :email, :password)
    end

    # def user_params
    #   params.require(:user).permit(:first_name, :email, :password )
    # end
     
end
