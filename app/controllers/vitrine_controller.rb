class VitrineController < ApplicationController

  # GET /
  # GET /index.html
  def index
    @unassigned_tasks = Task.unassigned
    @new_task = Task.new
  end
end
