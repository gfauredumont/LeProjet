class Project < ApplicationRecord
  validates :name, presence: true

  has_many  :projects_tasks
  has_many  :tasks, through: :projects_tasks
end
