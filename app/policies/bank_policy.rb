class BankPolicy < ApplicationPolicy
	def index?
		user.admin?
	end
end