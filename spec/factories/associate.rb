#Mi firts factoty with Factory Girl
FactoryGirl.define do 
   factory :associate do 
   	   name {Faker::Name.name}
   	   phone {Faker::PhoneNumber.phone_number}
   	   address {Faker::Address.street_address}

   	   sequence(:email) {|n| "joseluis#{n}@yumalitas.com"}
   	   supervisor_id 10
   	   city_id 23
   end
end