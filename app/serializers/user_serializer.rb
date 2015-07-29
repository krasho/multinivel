class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token

  has_many :roles, serializer: RolSerializer
end