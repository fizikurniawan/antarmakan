class Food < ApplicationRecord
	mount_base64_uploader :photo, PhotoUploader
end
