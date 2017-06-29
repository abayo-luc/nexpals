class Member < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :photo, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
