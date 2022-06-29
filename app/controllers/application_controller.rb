
class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    users_show_path
  end
end
    
