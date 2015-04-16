require 'rails_helper'

describe "BanksPages" , :type => :requests do

	describe "Index page" do
		let!(:banks) { FactoryGirl.create_list(:bank, 3) }
		context "List All Banks" do 
            before do 
            	visit banks_path
            end



			it "should be list of banks" do 
               banks.each do |bank|
                  expect(page).to have_content bank.name	
               end

			end

		end


	end 


	describe "Edit Page" do 
	end


	describe "Delete Page" do 
	end


	describe "Create Page" do 
	end



end 
