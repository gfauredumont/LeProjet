class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_projects

  private
    def get_projects
      @projects = Project.all
    end
end
