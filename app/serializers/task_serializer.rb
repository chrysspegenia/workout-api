class TaskSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :image_url, :repetitions, :sets, :completed, :user_id, :category_id, :due_date

end
