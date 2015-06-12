require 'rails_helper'

RSpec.describe "CitiesPages", type: :request do
   let!(:cities) {FactoryGirl.create_list(:city, 4)}


    before do 
      user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
    end


   describe "Index Pages" do 
   	   before do 
   	      visit cities_path
            save_and_open_page
   	   end
   	   
       context "Listing all cities" do
   	      it "Should List all available cities name" do 
   	         cities.each do |city|
                  expect(page).to have_content city.name
   	         	expect(page).to have_content city.state.name
   	         end	
   	      end
   	   end
   end

end
