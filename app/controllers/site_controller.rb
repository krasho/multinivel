class SiteController < ApplicationController
  include AssociatesLogic

  layout 'public'
  def index
  end

  def pagina

    paginas = ['beneficios', 'plan', 'preguntas', 'promociones', 'testimonios', 'eventos', 
     'contacto', 'empresa']

    if paginas.include? params[:page]
      render params[:page]
    else
      redirect_to :root
    end
  end

  def registro
    @socio = Associate.new
    render 'registro'
  end

  def create
    @socio = Associate.new(socio_params)

    if @socio.save
       flash[:success] = "Promotor Creado Satisfactoriamente"       
       redirect_to  :action => 'acceso', :socio => @socio.id       
    else
      render 'registro'
    end    
  end

  def acceso
    @socio = Associate.find(params[:socio])
    @user = User.new
    render 'acceso'
  end

  private
     def socio_params
      params.require(:associate).permit(:name, :phone, :email, :address, :zip_code)
     end

end
