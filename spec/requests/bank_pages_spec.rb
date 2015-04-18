require 'rails_helper'

describe "BanksPages" , :type => :requests do

	describe "Index page" do
		#let!(:banks) { FactoryGirl.create_list(:bank, 3) }
		context "List All Banks" do 

			it "should be list of banks" do 
			   visit banks_path
			   banks = Bank.all
               banks.each do |bank|
                  #expect(page).to have_content bank.name	
               end

			end

            it "Probando" do 
	            visit edit_bank_path
	            posts = Bank.all
	            posts.each do |post|
	            #page.should have_content post
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
