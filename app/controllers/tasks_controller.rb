class TasksController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @tasks = Task.where("project_id = ? AND user_id = ?", @project.id, current_user.id)
    @new_task = Task.new
  end

  def set_status
    @task = Task.find(params[:task_id])
    @task.update(task_params)
  end

  def create
    @task = Task.new()
    @task.update(task_params)
    redirect_to projects_path(params[:project_id]) if @task.save
  end

  def destroy
    @task = Task.find(params[:project_id])
    @task.destroy
    redirect_to projects_path(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :user_id, :priority, :status)
  end
end
