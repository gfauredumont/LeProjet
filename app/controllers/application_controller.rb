class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_projects

  private
    def get_projects
      # WARNING: projects_controller doesn't load projects anymore due to this
      @projects = Project.visible_to_me(user_signed_in? ? current_user : nil)
    end
end
