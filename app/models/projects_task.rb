class ProjectsTask < ApplicationRecord
  validates :project, presence: true
  validates :task, presence: true

  belongs_to :project
  belongs_to :task
end
