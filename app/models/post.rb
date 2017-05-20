class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  is_impressionable
end
