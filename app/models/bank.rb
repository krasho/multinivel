class Bank < ActiveRecord::Base
	validates :name, :presence=>true
	resourcify
end
