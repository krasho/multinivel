class BanksController < ApplicationController
	def index
		@banks = Bank.all
	end

    def new
    	@bank = Bank.new
    end

	def edit
		@bank = Bank.find(params[:id])
 
    rescue ActiveRecord::RecordNotFound
		#@bank.errors.add(:id, "El banco no existe")
		#@bank.errors[:id] << "El banco no existe"
		flash[:error] = "El banco no existe"
		redirect_to banks_path		
	end


    def show
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
