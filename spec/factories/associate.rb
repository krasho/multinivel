#Mi firts factoty with Factory Girl
FactoryGirl.define do 
   factory :associate do 
   	   name "Jose Luis"
   	   phone "9838671532"
   	   address "Conocida"

   	   sequence(:email) {|n| "joseluis#{n}@yumalitas.com"}
   	   supervisor_id 10
   	   city_id 23
   end
end