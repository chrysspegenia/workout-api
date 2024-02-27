class CategorySerializer
  include JSONAPI::Serializer
  attributes :title, :description, :user_id, :image_url

  has_many :tasks
end
