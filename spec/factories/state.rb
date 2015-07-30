FactoryGirl.define do 
	factory :state do 
		name {Faker::Address.city}


	trait :with_city_list do
      transient do
        number_of_cities 1
      end

      after(:create) do |state, evaluator|
        FactoryGirl.create_list(:cities, evaluator.number_of_cities, state: state)
      end
    end

	end
end