require 'rails_helper'

describe Associate do 
	it "Es inválido sin el nombre" do 
		socio = Associate.new(name: nil)
        socio.valid?

        expect(socio.errors[:name]).to include("can't be blank")
	end


	it "Es inválido sin el teléfono" do 
		socio = Associate.new(phone: nil)
		socio.valid?

		expect(socio.errors[:phone]).not_to include("can't be blank")

	end 
end
