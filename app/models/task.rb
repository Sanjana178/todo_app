class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
end
