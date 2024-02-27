class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name

  has_many :categories
  has_many :tasks
end
