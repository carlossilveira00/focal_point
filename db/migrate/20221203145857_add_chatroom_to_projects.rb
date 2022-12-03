class AddChatroomToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :chatroom, foreign_key: true
  end
end
