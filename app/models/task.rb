class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  has_many :categories
end
