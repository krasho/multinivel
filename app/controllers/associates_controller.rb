class AssociatesController < ApplicationController

  def index
    @associates = Associate.all
  end

  def edit
  	@associate = Associate.find(params[:id])

  rescue ActiveRecord::RecordNotFound 
      flash[:error] = "El socio no existe"
      redirect_to associates_path
  end

  def delete
  end

  def show
  	@associate = Associate.find(params[:id])

  rescue ActiveRecord::RecordNotFound 
      flash[:error] = "El socio no existe"
      redirect_to associates_path    
  end

end
