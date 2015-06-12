require 'rails_helper'

RSpec.describe "StatesPages", type: :request do
   let!(:states) {FactoryGirl.create_list(:state, 5)}


   describe "Index Pages" do 
   	   before do 
   	      visit states_path
   	   end
   	   
       context "Listing all cities" do
   	      it "Should List all available states name" do 
   	         states.each do |state|
   	         	expect(page).to have_content state.name
   	         end	
   	      end
   	   end
   end

end
