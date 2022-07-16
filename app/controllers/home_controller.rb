class HomeController < ApplicationController
  def index; end

  def destroy
    User.find(params[:id]).destroy
    flash[success] = 'User deleted'
    redirect_to root_url
  end
end
