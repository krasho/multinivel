class PaymentTypesController < ApplicationController
  before_action :set_payment_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @payment_types = PaymentType.all
  end

  def show
  end

  def new
    @payment_type = PaymentType.new
  end

  def create
    @payment_type = PaymentType.new(payment_type_params)

    respond_to do |format|
      if @payment_type.save
        format.html { redirect_to @payment_type, notice: 'El tipo de pago fue creado correctamente.' }
        format.json { render :show, status: :created, location: @payment_type }
      else
        format.html { render :new }
        format.json { render json: @payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @payment_type.update(payment_type_params)
        format.html { redirect_to @payment_type, notice: 'El tipo de pago fue modificado correctamente.' }
        format.json { render :show, status: :ok, location: @payment_type }
      else
        format.html { render :edit }
        format.json { render json: @payment_type.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @payment_type.destroy
    respond_to do |format|
      format.html { redirect_to payment_types_url, notice: 'El tipo de pago fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_payment_type
      @payment_type = PaymentType.find(params[:id])
    end

    def payment_type_params
      params.require(:payment_type).permit(:name)
    end
end
