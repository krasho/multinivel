class BanksController < ApplicationController
	def index
		@banks = Bank.all
	end

	def edit
		@bank = Associate.find(params[:id])
	end
end
