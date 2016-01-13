class Property < ActiveRecord::Base
belongs_to :user
searchkick
mount_uploader :picture, PictureUploader
end


