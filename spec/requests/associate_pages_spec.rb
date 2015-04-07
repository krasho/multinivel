require 'rails_helper'

describe "AssociatePages", :type => :requests do
	describe "Home Page" do 
		context "List all associates" do 
			let!(:associate1) {FactoryGirl.create(:associate)}
			let!(:associate2) {FactoryGirl.create(:associate)}
			let!(:associate3) {FactoryGirl.create(:associate)}


			it "should list all available associates names" do 
				visit associates_path

				socios = Associate.all

				socios.each do |socio|
					expect(page).to have_content socio.name
				end 
			end

			it "should list all available associates email" do 

				visit associates_path

				socios = Associate.all

				socios.each do |socio|
					expect(page).to have_content socio.email
				end 

			end

		end
	end
end
