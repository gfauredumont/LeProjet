class Task < ApplicationRecord
  validates :name, presence: true

  has_many  :projects_tasks
  has_many  :projects, through: :projects_tasks

  scope :unassigned, -> { Task.includes(:projects).where( :projects => { :id => nil } ) }
end
