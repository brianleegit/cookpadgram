class Photo < ApplicationRecord
  validates :img, presence: true
  has_attached_file :img, styles: { :medium => "640x" }
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
