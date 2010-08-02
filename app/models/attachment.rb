class Attachment < ActiveRecord::Base
  belongs_to :step
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/steps/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/steps/:id/:style/:basename.:extension"
  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  
end
