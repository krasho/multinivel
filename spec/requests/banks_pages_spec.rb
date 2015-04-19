require 'rails_helper'

RSpec.describe "BanksPages", type: :requests do
	
	describe "Index Page" do 
		let!(:banks) { FactoryGirl.create_list(:bank, 4) }	
		before do 
		   visit banks_path
		end

		context "Listing all banks" do 
			it "Should list all available banks names" do 
				banks.each do |bank|
					expect(page).to have_content bank.name
				end
			end
		end
	end


	describe "Edit Page" do
		let!(:banks) { FactoryGirl.create_list(:bank, 4) }	
        let!(:bank) {banks.first}


		before do 
			visit banks_path
			click_link bank.name
		end

		it "Should appear the name of the bank" do 
			expect(page).to have_content bank.name
		end 
	end
end
