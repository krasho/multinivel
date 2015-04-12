require 'rails_helper'

describe "AssociatePages", :type => :requests do
    subject { page }

	let!(:socios) { FactoryGirl.create_list(:associate, 3) }

	describe "Home Page" do 
		context "List all associates" do 
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
		context "Valid Associate"  do
	       let!(:associate) {socios.first}

	       before do 
	          visit associates_path
	          click_link associate.email
	          #save_and_open_page	
	       end

	       #it "should have associate info" do 
	       #   expect(page).to have_content associate.email
	       #   expect(page).to have_content associate.phone	
	       #end

	       it "should be on the associate page" do 
	       	   expect(page).to have_selector "h1", :text => "#{associate.name} - #{associate.email}"
	       end
	    end

	    context "Invalid Associate" do
	    	before do 
	    		visit edit_associate_path(-1)
	    	end

	    	it "Redirecting to home page" do
	    		expect(page).to have_selector "h1", :text => "Listado de Socios"
	    	end

	    	it "Error of Associate" do
	    		expect(page).to have_content "El socio no existe"
	    	end
	    end 
	end
end
