class Image < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300", small: "200", thumb: "100" }
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  belongs_to :item
end
