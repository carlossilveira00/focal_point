class ProjectsController < ApplicationController
  def show
    # @users will be an array of all the users related to this project.
    @users = []
    @project = Project.find(params[:id])
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
    @new_task = Task.new
    @new_user_project = UserProject.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.chatroom_id = Chatroom.create(name: @project.name).id

    if @project.save
      redirect_to project_path(@project.id), notice: 'Project successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'We were not able to create a new project.'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to profile_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :content, photos: [])
  end
end
