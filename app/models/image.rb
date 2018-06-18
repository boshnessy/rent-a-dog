class Image < ApplicationRecord
  belongs_to :dog
  has_attached_file :picture
    
  validates_attachment :picture,
    content_type: {
      content_type: ["picture/jpeg", "picture/gif", "picture/png"]
    }
end
