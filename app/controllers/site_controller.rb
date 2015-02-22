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

end
