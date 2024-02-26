class CategorySerializer
  include JSONAPI::Serializer
  attributes :title, :description, :user_id
end
