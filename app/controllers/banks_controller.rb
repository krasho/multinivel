class BanksController < ApplicationController
	def index
		@banks = Bank.all
	end

	def edit
		@bank = Bank.find(params[:id])
 
    rescue ActiveRecord::RecordNotFound
		flash[:error] = "El banco no existe"
		redirect_to banks_path		
	end


    def show
    end

    def update 
      @bank = Bank.find(params[:id])

      respond_to do |format|
      
	      if @bank.update(bank_params)
	        format.html { redirect_to banks_path, notice: 'Registro Guardado Satisfactoriamente' }
	        format.json { render :index, status: :ok, location: @bank }
	      else
	        format.html { render :edit}
	        format.json { render json: @bank.errors, status: :unprocessable_entity }
	      end
	  end    

    end


	private
    def bank_params
      params.require(:bank).permit(:name, :state_id)
    end

end
