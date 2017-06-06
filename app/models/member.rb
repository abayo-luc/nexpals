class Member < ApplicationRecord
  attr_accessor :photo
  mount_uploader :photo, AvatarUploader
end
