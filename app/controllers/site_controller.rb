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

  def createUser
    @user = User.new(user_params)
    @socio = Associate.find(params[:socio])

    @user.email = @socio.email 
     

    if @user.save
       flash[:success] = "Promotor Creado Satisfactoriamente"       
       redirect_to  :action => 'confirmacion', :socio => params[:socio]             
    else
      render 'acceso'
    end
  end

  def confirmacion
    @socio = Associate.find(params[:socio])
    render 'confirmacion'
  end

  private
     def socio_params
      params.require(:associate).permit(:name, :phone, :email, :address, :zip_code)
     end

     def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
     end
end
