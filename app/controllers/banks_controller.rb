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
end
