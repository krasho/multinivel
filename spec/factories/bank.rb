FactoryGirl.define do 
   factory :bank do 
   	   #name "prueba" #{Faker::Name.name}
   	   sequence(:name) { |n| "Post number #{n}" }
   end
end