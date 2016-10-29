class ProjectsUser < ApplicationRecord
  validates :project, :user, presence: true

  belongs_to :project
  belongs_to :user
end
