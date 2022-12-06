class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def performance
    @users = []
    @project = Project.find(params[:project_id])
    @tasks = Task.where("project_id = ?", @project.id)
    # Get all the user_projects who have an invitation with the status accepted and an project_id of this project.
    @users_assigned_to_project = UserProject.where(["project_id = ? and invitation_accepted = ?", @project.id, true])
    # Loop and find the users through the user_id and push them into the @users array
    @users_assigned_to_project.each do |user_project|
      @users << User.find(user_project.user_id)
    end
    # Find the user who created the project and push them to the array aswell. Because
    # you want to be able to select them to a task.
    @users << @project_owner = User.find(@project.user_id)
  end

  # Method do render the count of the tasks for a specific project
  def tasks_status
    @project = Project.find(params[:project_id])
    @tasks = Task.where("project_id = ?", @project.id)
    render json: @tasks.group(:status).count
  end

  # Method do render the count of tasks for all the users enroled with the project.
  def user_tasks
    @project = Project.find(params[:project_id])
    @tasks = Task.where("project_id = ?", @project.id)

    render json: @tasks.joins(:user).group(:first_name).count
  end

  # Method do render the count of the tasks completed by each day of the week
  def completed_tasks_by_day
    @project = Project.find(params[:project_id])

    render json: Task.where(["status = ? and project_id = ?", "Completed", @project.id]).group_by_day_of_week(:created_at, format: "%a").count
  end

  def ticket_show
  end

end
