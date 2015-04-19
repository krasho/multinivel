require 'rails_helper'

RSpec.describe "BanksPages", type: :requests do

    let!(:banks) { FactoryGirl.create_list(:bank, 4) }	

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
end
