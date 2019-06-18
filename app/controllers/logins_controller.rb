class LoginsController < ApplicationController
  before_action :forbid_login_user, {only: [:login]}

  def login
    @user = User.find_by(email: params[:email])
    if @user # && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You logged in successfully!"
      redirect_to ("/users/#{@user.id}")
    else
      @error_message = "Don't you have the wrong email address or password?"
      @email = params[:email]
      @password = params[:password]
      render ("logins/login")
    end
  end

  def login_form
    @user = User.find_by(email: params[:email], password: params[:password])
  end
end
