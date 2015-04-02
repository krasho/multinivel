require 'rails_helper'

describe Associate do 
   context "Situaciones de invalidez" do
		it "Es inválido sin el nombre" do 
			socio = Associate.new(name: nil)
	        socio.valid?
	        
	        expect(socio.errors[:name]).to include("can't be blank")
		end


		it "Es inválido sin el teléfono" do 
			socio = Associate.new(phone: nil)
			socio.valid?

			expect(socio.errors[:phone]).to include("can't be blank")
		end 

		it "Es inválido sin el correo" do 
			socio = Associate.new(email: nil)
			socio.valid?

			expect(socio.errors[:email]).to include("can't be blank")
		end

		it "Es inválido sin el supervisor" do 
			socio = Associate.new(supervisor_id: nil)
			socio.valid?

			expect(socio.errors[:supervisor_id]).to include("can't be blank")
		end

		it "Supervisor es inválido sino es número" do 
			socio = Associate.new
			socio.supervisor_id = "uno"

			socio.valid?
			
			expect(socio.errors[:supervisor_id]).to include("is not a number")
		end 


		it "Es inválido sin la ciudad" do 
			socio = Associate.new(city_id: nil)
			socio.valid?

			expect(socio.errors[:city_id]).to include("can't be blank")
		end

		it "Ciudad es invália sino es un número" do 
			socio = Associate.new
			socio.city_id = "uno"
            socio.valid?

            expect(socio.errors[:city_id]).to include("is not a number")


		end

		it "Email inválido" do
            invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                                foo@bar_baz.com foo@bar+baz.com]
            
            invalid_addresses.each do |invalid_address|
               socio = Associate.new
               socio.email = invalid_address
               socio.valid?
            
               expect(socio).to_not be_valid
             
            end			
		end
   end	

   context "Situaciones válidas" do
   	   it "Supervisor válido si es número" do
			socio = Associate.new
			socio.supervisor_id = 1
			socio.valid?

			expect(socio.errors[:supervisor_id]).not_to include("is not a number")
   	   end

		it "Email válido" do
            valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]            
            valid_addresses.each do |valid_address|
               socio = Associate.new
               socio.name  = "Jose"
               socio.supervisor_id = 1
               socio.city_id = 1
               socio.email = valid_address
               socio.phone = "1111"
               socio.valid?
            
               expect(socio).to be_valid
             
            end			
		end

   end

end
