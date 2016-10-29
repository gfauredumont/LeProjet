class Project < ApplicationRecord
  validates   :name, :owner, presence: true

  has_many    :projects_tasks
  has_many    :tasks, through: :projects_tasks

  has_many    :projects_users
  has_many    :members, through: :projects_users, source: 'user'

  belongs_to  :owner, class_name: 'User'

  def add_member(new_member)
    members << new_member
  end

  def remove_member(member)
    members.delete(member)
  end
end
