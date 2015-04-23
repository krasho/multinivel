require 'rails_helper'

RSpec.describe "BanksPages", type: :requests do
	let!(:banks) {FactoryGirl.create_list(:bank, 4) }
	describe "Index Page" do 		
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
        context "Correct Bank" do 
	        let!(:bank) {banks.first}
			before do 
				visit banks_path
				click_link bank.name
				save_and_open_page 
			end

			it "Should appear the name of the bank" do 
				expect(page).to have_content bank.name
			end 
        end

	end
end
