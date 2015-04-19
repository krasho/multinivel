require 'rails_helper'

RSpec.describe "BanksPages", type: :request do
	describe "Index Page" do 
		context "Listing all banks" do 
			let!(:bank1){Bank.create!(:name=>"Bancomer")}
			let!(:bank2){Bank.create!(:name=>"Banamex")}
			let!(:bank3){Bank.create!(:name=>"Hsbc")}

			let!(:bank4){Bank.create!(:name =>"Scotiabank")}

			it "Should list all available banks names" do 
				visit root_path
				banks = Bank.all 
				banks.each do |bank|
					expect(page).to have_content bank.name
				end
			end
		end

	end
end
