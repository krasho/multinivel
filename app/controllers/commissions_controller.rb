class CommissionsController < ApplicationController
  before_action :set_commission, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @commissions = Commission.all
  end

  def show
  end

  def new
    @commission = Commission.new
  end

  def edit
  end

  def create
    @commission = Commission.new(commission _params)

    respond_to do |format|
      if @commission.save
        format.html { redirect_to @commission, notice: 'La comision fue creada correctamente.' }
        format.json { render :show, status: :created, location: @commission }
      else
        format.html { render :new }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @commission.update(commission_params)
        format.html { redirect_to @commission, notice: 'La comision fue modificada correctamente.' }
        format.json { render :show, status: :ok, location: @commission }
      else
        format.html { render :edit }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy 
    @commission.destroy
    respond_to do |format|
      format.html { redirect_to commission_url, notice: 'La comision fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commission
      @commission = Commission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commission_params
      params.require(:commission).permit(:purchase_amount, :calculation_start_date, :calculation_end_date, :amount, :type, :payed)
    end
end
