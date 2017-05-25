class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  # is_impressionable
  has_many :comments, dependent: :destroy

  # def should_generate_new_friendly_id?
  #   new_record?
  # end
end
