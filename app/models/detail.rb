class Detail < ActiveRecord::Base
  belongs_to :step
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/details/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/details/:id/:style/:basename.:extension"
  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_presence :photo
end
