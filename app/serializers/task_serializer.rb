class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :image_url, :repetitions, :sets, :completed, :user_id, :category_id

  # has_many :categories
end
