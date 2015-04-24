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
			end

			it "Should appear the name of the bank" do 
				expect(page).to have_content bank.name
			end 
        end

        context "Incorrect Bank" do 
        	before do
        		visit edit_bank_path -1
        	end


        	it "Redirecting to Home Page" do
        		expect(page).to have_content "Listado de Bancos"
        	end

        	it "Showing error message" do 
        		expect(page).to have_content "El banco no existe"        		
        	end
        end

	end

	describe " Insert bank" do 
		let!(:bank) {banks.first}
		before do 	        
			visit edit_bank_path bank.id
			fill_in "name", :with=>"Banco Patito"
		end


		it "Checking if the record saves " do
			expect(page).to have_content "Registro Creado Satisfactoriamente"
		end 
	end
end
