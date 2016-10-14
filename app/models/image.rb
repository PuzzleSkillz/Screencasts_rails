class Image < ApplicationRecord
	mount_uploader :image, ImageUpLoader
	belongs_to :imageable, polymorhic: true
end
