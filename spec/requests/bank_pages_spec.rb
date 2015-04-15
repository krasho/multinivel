require "rails_helper"

describe "BankPages", :type => :requests do 
	describe "Index Page" do 
		context "List All Banks" do 
			before do 
				visit banks_path
			end

			it "Validating the list" do 
				@banks = Bank.all
				@banks.each do [bank]
					expect(page).to have_content @bank.name
				end
			end
		end 
	end
end