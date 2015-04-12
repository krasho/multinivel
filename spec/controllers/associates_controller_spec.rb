require "rails_helper"

describe AssociatesController do 
   describe "edit" do
   	   before do 
   	   	   get :edit, :id=>-1
   	   end


   	   it "Redirecting to the home page" do
   	   	   expect(response).to redirect_to(associates_path)
   	   end


   	   it "Shows an error" do 
   	   	   expect(flash[:error]).to eql("El socio no existe")
   	   end

   end
end