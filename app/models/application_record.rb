class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.before_action
    set_current_user
    authenticate_user
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user.id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "Please login"
      redirect_to("/login")
    end
  end
end
