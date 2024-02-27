class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :image_url, :repititions, :sets, :completed, :user_id, :category_id
end
