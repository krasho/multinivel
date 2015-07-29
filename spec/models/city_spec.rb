require 'rails_helper'

RSpec.describe City, type: :model do
  describe "Factory" do
  	let(:city) {FactoryGirl.build(:city)}

  	it "factory should be valid" do
      expect(city).to be_valid
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
 

  describe "associations" do
    it { is_expected.to belong_to(:state)}
  end

end
