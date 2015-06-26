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
	    @bank = Bank.new(bank_params)

	    respond_to do |format|
	      if @bank.save
	        format.html { redirect_to banks_path, notice: 'Registro Guardado Satisfactoriamente' }
	        format.json { render :index, status: :created, location: @bank }
	      else
	        format.html { render :new }
	        format.json { render json: @bank.errors, status: :unprocessable_entity }
	      end
	    end
    end

    def update 
      @bank = Bank.find(params[:id])

      respond_to do |format|
      
	      if @bank.update(bank_params)
  	         format.html {}	            
             format.json { render json: @bank }

	      else
	        format.html {}
	        format.json { render json: @bank.errors, status: :unprocessable_entity }
	      end
	  end    

    end


	def destroy
	   @bank = Bank.find(params[:id])
	   @bank.destroy
	   respond_to do |format|
	      format.html { redirect_to banks_path, notice: 'El banco fue eliminado correctamente.' }
	      format.json { head :no_content }
	   end
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
