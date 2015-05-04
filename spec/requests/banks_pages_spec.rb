require 'rails_helper'

RSpec.describe "BanksPages", type: :requests  do	
	let!(:banks) {FactoryGirl.create_list(:bank, 4) }

	describe "Delete a bank", :js => true do
	    let!(:bank) {banks.first}
		before do 
			visit banks_path
		end

		it "Showing confirmation of error" do 
            find_by_id('del'+bank.id.to_s).click
            sleep 1.seconds
            alert = page.driver.browser.switch_to.alert

            expect { alert.accept }.to change(banks, :count).by(-1)
		end 
	end
end
