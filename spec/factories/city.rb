FactoryGirl.define do 
	factory :city do 
		state
		name {Faker::Name.name}
	end
end

