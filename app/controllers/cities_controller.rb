class CitiesController < ApplicationController
	before_action :authenticate_user!

	def index
		@cities = City.all
	end
end
