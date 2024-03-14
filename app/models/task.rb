class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # has_many :categories

  validates :title, presence: true
end
