class Member < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true
end
