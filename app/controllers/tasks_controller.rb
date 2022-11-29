class TasksController < ApplicationController

  def set_status
    @task = Task.find(params[:task_id])
    @task.update(task_params)
  end

  def create
    @task = Task.new()
    @task.update(task_params)
    if @task.save
      redirect_to projects_path(params[:project_id])
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :project_id, :user_id, :priority, :status)
  end
end
