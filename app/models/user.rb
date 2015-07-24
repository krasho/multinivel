class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true          

  before_create :generate_authentication_token!
  enum role: [:admin, :client, :supervisor]
  rolify :before_add => :set_default_role

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_default_role(role)
      #self.role ||= :client
  end

  def getRolesByUser()
    roles_names = ''
    self.roles.each do |role|
      roles_names += "#{role.name} "
    end
    roles_names.strip()
  end

end
