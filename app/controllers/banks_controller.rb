class BanksController < ApplicationController
  #before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def index
    @banks = Bank.all
  end

  def show
  end

  def new
    @bank = Bank.new
  end

  def edit
  end

  def create
    @bank = Bank.new(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'El banco fue creado correctamente.' }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to @bank, notice: 'El banco fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank.destroy
    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'El banco fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank
      @bank = Bank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:name)
    end
end
