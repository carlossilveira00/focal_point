class TicketsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tickets = Ticket.where("project_id = ?", @project.id)
  end

  def new
    @project = Project.find(params[:project_id])
    @ticket = Ticket.new
  end

  def create
    @project = Project.find(params[:project_id])
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to project_ticket_path(@project.id, @ticket.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @ticket = Ticket.find(params[:id])
    @comments = Comment.where("ticket_id = ?", @ticket.id)
    @new_comment = Comment.new()
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :user_id, :status, :project_id)
  end
end
