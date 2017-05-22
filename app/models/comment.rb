class Comment < ApplicationRecord
  validates :content, presence: { message: "comment cannot be empty" }
  belongs_to :user
  belongs_to :photo
end
