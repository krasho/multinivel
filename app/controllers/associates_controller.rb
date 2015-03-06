class AssociatesController < ApplicationController
  before_action :set_associate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @associates = Associate.all
  end

  def show
  end

  def new
    @associate = Associate.new
  end

  def edit
  end

  def create
    @associate = Associate.new(associate_params)

    respond_to do |format|
      if @associate.save
        format.html { redirect_to @associate, notice: 'El socio fue creado correctamente.' }
        format.json { render :show, status: :created, location: @associate }
      else
        format.html { render :new }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @associate.update(associate_params)
        format.html { redirect_to @bank, notice: 'El socio fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @associate }
      else
        format.html { render :edit }
        format.json { render json: @associate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @associate.destroy
    respond_to do |format|
      format.html { redirect_to associates_url, notice: 'El socio fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associate
      @associate = Associate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associate_params
      params.require(:associate).permit(:name, :admission_date, :phone, :address, :zip_code, :email, :account_number, :clabe, :is_supervisor, :supervisor_id)
    end
end
