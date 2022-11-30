class TicketsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tickets = Ticket.where("project_id = ?", @project.id)
  end
end
