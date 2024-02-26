class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  has_many :categories
end
