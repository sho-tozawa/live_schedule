class LiveHousesController < ApplicationController
  before_action :set_live_house, only: [:show, :edit, :update, :destroy]

  # GET /live_houses
  # GET /live_houses.json
  def index
    @live_houses = LiveHouse.where(user_id: @current_user.id).page(params[:page]).per(10)
  end

  # GET /live_houses/1
  # GET /live_houses/1.json
  def show
  end

  # GET /live_houses/new
  def new
    @live_house = LiveHouse.new
  end

  # GET /live_houses/1/edit
  def edit
  end

  # POST /live_houses
  # POST /live_houses.json
  def create
    @live_house = LiveHouse.new(live_house_params)
    @live_house.user_id = @current_user.id

    respond_to do |format|
      if @live_house.save
        format.html {redirect_to @live_house, notice: 'Live house was successfully created.'}
        format.json {render :show, status: :created, location: @live_house}
      else
        format.html {render :new}
        format.json {render json: @live_house.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /live_houses/1
  # PATCH/PUT /live_houses/1.json
  def update
    respond_to do |format|
      if @live_house.update(live_house_params)
        format.html {redirect_to @live_house, notice: 'Live house was successfully updated.'}
        format.json {render :show, status: :ok, location: @live_house}
      else
        format.html {render :edit}
        format.json {render json: @live_house.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /live_houses/1
  # DELETE /live_houses/1.json
  def destroy
    @live_house.destroy
    respond_to do |format|
      format.html {redirect_to live_houses_url, notice: 'Live house was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_live_house
    @live_house = LiveHouse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def live_house_params
    params.require(:live_house).permit(:name, :the_nearest_station, :user_id)
  end
end
