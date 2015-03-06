class CompaniesController < ApplicationController
  include CompaniesLogic
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'La empresa fue creada correctamente.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'La empresa fue modificada correctamente.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to company_url, notice: 'La empresa fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  #Metodo que se llama para dar de alta clientes
  def supervisor

    @associates = Associate.where("is_supervisor = ?", false)
    @display = "none"

    #Validacion que verifica si hay algo en los inputs del formulario
    if(params['nombre'])
       nombre = params['nombre']
       @nombre = nombre
       @display = "block"

       if(not nombre.blank?)
          @associates = @associates.where("name like ?", "%#{params['nombre']}%")
       end


    end

    if(params['email'])
       email = params['email']
       @email = email
       @display = "block"

       if(not email.blank?)
          @associates = @associates.where("email like ?", "%#{params['email']}%")
       end
       #
    end



    @listAssociates = Associate.where("is_supervisor = ?", true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :rfc, :address, :telephone, :email)
    end
end
