class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :authenticate_user, only: [:index, :show, :edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to users_url, notice: 'User was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

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
      render ("users/login_form")
    end
  end

  def login_form
    @user = User.find_by(email: params[:email], password: params[:password])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You logged out successfully!"
    redirect_to ("/login")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "You don't have the authority"
      redirect_to("/login")
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id, :name, :age, :email, :password)
  end
end
