class CommissionTypesController < ApplicationController
  before_action :set_commission_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @commission_types = CommissionType.all
  end

  def show
  end

  def new
    @commission_type = CommissionType.new
  end

  def edit
  end

  def create
    @commission_type = CommissionType.new(commission_type_params)

    respond_to do |format|
      if @commission_type.save
        format.html { redirect_to @commission_type, notice: 'El tipo de comisión fue creado correctamente.' }
        format.json { render :show, status: :created, location: @commission_type }
      else
        format.html { render :new }
        format.json { render json: @commission_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @commission_type.update(commission_type_params)
        format.html { redirect_to @commission_type, notice: 'El tipo de comisión fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @commission_type }
      else
        format.html { render :edit }
        format.json { render json: @commission_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @commission_type.destroy
    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'El tipo de comisión fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commission_type
      @commission_type = CommissionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commission_type_params
      params.require(:commission_type).permit(:name)
    end
end
