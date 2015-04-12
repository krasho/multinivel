class AssociatesController < ApplicationController

  def index
    @associates = Associate.all
  end

  def edit
  	@associate = Associate.find(params[:id])
  end

  def delete
  end

  def show
  	@associate = Associate.find(params[:id])
  end

end
