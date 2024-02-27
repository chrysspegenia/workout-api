class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category, dependent: nullify

  has_many :categories
end
