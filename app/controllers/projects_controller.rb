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
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to project_path(@project.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :photos)
  end
end
