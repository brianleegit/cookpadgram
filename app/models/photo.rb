class Photo < ApplicationRecord
  validates :user_id, presence: true
  validates :img, presence: { message: "image cannot be empty" }
  validates :caption, presence: { message: "caption cannot be empty" }
  has_attached_file :img, styles: { :medium => "640x" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments, dependent: :destroy
end
