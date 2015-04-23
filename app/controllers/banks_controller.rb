class BanksController < ApplicationController
	def index
		@banks = Bank.all
	end

	def edit
		@bank = Bank.find(params[:id])
	end
end
