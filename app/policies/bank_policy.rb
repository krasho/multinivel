class BankPolicy < ApplicationPolicy
  class Scope < Scope
	def resolve
	  scope
	end
  end
  def update?
     @user.has_role? :admin
  end

  def create?
  	@user.has_role? :admin
  end
end