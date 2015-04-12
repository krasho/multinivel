require 'rails_helper'

describe "AssociatePages", :type => :requests do

    subject {
    	page
    }

	describe "Home Page" do 
		context "List all associates" do 
			#let!(:associate1) {FactoryGirl.create(:associate)}
			#let!(:associate2) {FactoryGirl.create(:associate)}
			#let!(:associate3) {FactoryGirl.create(:associate)}

			#let (:socios){Associate.all}

			let!(:socios) { FactoryGirl.create_list(:associate, 3) }

            before do 
            	visit associates_path
            end 


			it "should list all available associates names" do 
				socios.each do |socio|
					expect have_content socio.name
					#expect(page).to have_content socio.name
				end 
			end

			it "should list all available associates email" do 
				socios.each do |socio|
					expect have_content socio.email
					#expect(page).to have_content socio.email
				end 

			end

		end
	end

	describe "show associate" do 
       let!(:socios) { FactoryGirl.create_list(:associate, 3) }
       let!(:associate) {socios.first}

       before do 
          visit associates_path
          click_link associate.email
          save_and_open_page	
       end

       it "should have associate info" do 
          expect(page).to have_content associate.email
          expect(page).to have_content associate.phone	
       end

       it "should be on the associate page" do 
       	   expect(page).to have_selector "h1", :text => "#{associate.name} - #{associate.email}"
       end
	end
end
