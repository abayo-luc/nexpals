class Member < ApplicationRecord
  attr_accessor :photo, :first_name, :last_name, :phone, :email, :location, :short_bio, :title, :photo
  mount_uploader :photo, PhotoUploader
end
