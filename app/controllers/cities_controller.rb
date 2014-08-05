class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :fill_lookup_tables, only: [:show, :new, :edit, :update]
  before_action :authenticate_user!

  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'La ciudad fue creada correctamente.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'La ciudad fue modificada correctamente.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'La ciudad fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def fill_lookup_tables
      @states = State.all
    end

    def city_params
      params.require(:city).permit(:name, :state_id)
    end
end
