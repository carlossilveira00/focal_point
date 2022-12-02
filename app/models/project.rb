class Project < ApplicationRecord
  has_rich_text :content
  has_many_attached :photos
  belongs_to :user
end
