require 'rails_helper'

RSpec.describe "BanksPages", type: :requests  do	
	let!(:banks) {FactoryGirl.create_list(:bank, 4) }

    before do 
    	user = FactoryGirl.create(:user)
        login_as(user, :scope => :user)
    end
 

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


	describe "Edit Bank" do		
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

	describe " Update bank" do 
		let!(:bank) {banks.first}

        context "With valid data" do
			before do 	        
				visit edit_bank_path bank.id		
				fill_in "bank_name", :with=>"Banco Patito"				
				click_button "Guardar"
			end


			it "Checking if the record saves " do
				expect(page).to have_content "Registro Guardado Satisfactoriamente"
			end         	
        end

        context "With Invalid data" do 
			before do 	        
				visit edit_bank_path bank.id
				fill_in "bank_name", :with=>""		
				click_button "Guardar"
			end


			it "Showing error without name" do				
				expect(page).to have_content "Name can't be blank"
			end         	
        end 
	end

    describe "new bank" do 
    	before do 
    		visit banks_path
    		click_link "Agregar banco"
    	end

    	it "Should appear the text 'Agregar un banco'" do
    		expect(page).to have_content "Agregar un banco"
    	end 
    end

	describe "Create bank" do 
		context "With valid data" do
			before do
				visit new_bank_path
				fill_in "bank_name", :with=>"Banco del Sureste"
				click_button "Guardar"				
			end

			it "Checking if the record saves" do 
				expect(page).to have_content "Registro Guardado Satisfactoriamente"
			end
		end

		context "With invalid data" do 
			before do
				visit new_bank_path
				click_button "Guardar"				
			end

			it "Showing error without name" do				
				expect(page).to have_content "Name can't be blank"
			end         	
		end
	end

	describe "Delete a bank" do
	    let!(:bank) {banks.first}
		before do 
			visit banks_path
			find_by_id('del'+bank.id.to_s).click
		end

		it "Showing confirmation of error" do 
            expect(page).to have_content "El banco fue eliminado correctamente."           
		end 
	end
end
