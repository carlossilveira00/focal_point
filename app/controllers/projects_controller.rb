class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @tasks = Task.all
    @new_task = Task.new
  end

  def new
    @project = Project.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
