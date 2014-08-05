class SupervisorsController < ApplicationController
  before_action :set_supervisor, only: [:show, :edit, :update, :destroy]
  before_action :fill_lookup_tables, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!

  def index
    @supervisors = Supervisor.all
  end

  def show
  end

  def new
    @supervisor = Supervisor.new
  end

  def edit
  end

  def create
    @supervisor = Supervisor.new(supervisor_params)

    respond_to do |format|
      if @supervisor.save
        format.html { redirect_to @supervisor, notice: 'El supervisor fue creado correctamente.' }
        format.json { render :show, status: :created, location: @supervisor }
      else
        format.html { render :new }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @supervisor.update(supervisor_params)
        format.html { redirect_to @supervisor, notice: 'El supervisor fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @supervisor }
      else
        format.html { render :edit }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supervisor.destroy
    respond_to do |format|
      format.html { redirect_to supervisors_url, notice: 'El supervisor fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_supervisor
      @supervisor = Supervisor.find(params[:id])
    end

    def fill_lookup_tables
      @companies = Company.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supervisor_params
      params.require(:supervisor).permit(:name, :entry_date, :company_id)
    end
end
