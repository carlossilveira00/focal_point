class UserProjectsController < ApplicationController
  def index
    @projects = Project.where("user_id = ?", current_user.id)
    @participating_projects = UserProject.where(["user_id = ? AND invitation_accepted = ?", current_user.id, true])
    @invitations = UserProject.where(["user_id = ? AND invitation_accepted = ?", current_user.id, false])
  end

  def create
    @user = User.find_by("email = ? ", params[:other][:email])
    @project = Project.find(params[:project_id])
    @user_project = UserProject.new(user_id: @user.id, project_id: @project.id)
    @user_project.invitation_accepted = false

    if @user_project.save
      redirect_to project_path(@project), notice: 'User successfully invited.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @user_project = UserProject.find(params[:user_project_id])
    @user_project.invitation_accepted = true

    redirect_to project_path(params[:project_id]) if @user_project.save
  end

  def decline
    @user_project = UserProject.find(params[:user_project_id])
    @user_project.destroy
    redirect_to profile_path
  end
end
