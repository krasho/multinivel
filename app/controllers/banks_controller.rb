class BanksController < ApplicationController
	def index
		@banks = Bank.all
	rescue
	    	
	end
end
