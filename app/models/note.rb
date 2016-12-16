class Note < ActiveRecord::Base
	has_ancestry
	belongs_to :user
	belongs_to :category
  validates :name, :body, :presence => true
  has_attached_file :image
  validates_attachment_content_type :image,:content_type => [ 'image/jpeg','image/jpg', 'image/png', 'image/gif','image/bmp', 'image/x-png', 'image/pjpeg' ]
def self.search(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("name LIKE ?", "%#{search}%")
end
end
