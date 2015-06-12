FactoryGirl.define do 
	factory :state do 
		name {Faker::Address.city}
	end
end