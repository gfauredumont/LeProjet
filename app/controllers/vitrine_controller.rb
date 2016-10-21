class VitrineController < ApplicationController

  # GET /
  # GET /index.html
  def index
    @projects = Project.all
    @unassigned_tasks = Task.unassigned
  end
end
