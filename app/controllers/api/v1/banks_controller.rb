class Api::V1::BanksController < ApplicationController
	before_action :set_bank, only: [:edit, :update, :destroy]
	#before_action :authenticate_user!
	protect_from_forgery with: :null_session

	def index
		@banks = Bank.all

       respond_to do |f|
          f.html {}
          f.json { render json: @banks }
       end        
	end

    def new
    	@bank = Bank.new
    end

	def edit
	end


    def show
		@banks = Bank.find(params[:id])

       respond_to do |f|
          f.html {}
          f.json { render json: @banks }
       end        

    end
 
    def create
    end

    def update 
		@banks = Bank.all

       respond_to do |f|
          f.html {}
          f.json { render json: @banks }
       end        

    end


	def destroy
	end


	private
    def bank_params
      params.require(:bank).permit(:name, :state_id)
    end

    def set_bank 
		@bank = Bank.find(params[:id])
 
    rescue ActiveRecord::RecordNotFound
		flash[:error] = "El banco no existe"
		redirect_to banks_path		    	
    end

end
