class AssociatesController < ApplicationController

  def index
    @associates = Associate.all
  end

end
