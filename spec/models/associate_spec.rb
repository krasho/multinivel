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

		it "Email inválido"
   end	

   context "Situaciones válidaz" do
   	   it "Supervisor válido si es número" do
			socio = Associate.new
			socio.supervisor_id = 1
			socio.valid?

			expect(socio.errors[:supervisor_id]).not_to include("is not a number")
   	   end
   end

end
