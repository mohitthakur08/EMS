class UsersController < ApplicationController
  
  def show
    
  
    
  end
  
  
 

  def index
    @users = User.all
    @projects =Project.all
  end

    private

    def user_params
      params.require(:user).permit(:first_name, :email, :password, )
    end
     
end
