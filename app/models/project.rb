class Project < ApplicationRecord
  has_one :chatroom, class_name: "chatroom", foreign_key: "chatroom_id"
  has_many :user_projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_rich_text :content
  has_many_attached :photos
  belongs_to :user
end
