class UserProjectsController < ApplicationController
  def index
    @projects = Project.where("user_id = ?", current_user.id)
  end
end
