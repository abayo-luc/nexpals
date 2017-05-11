class Comment < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :post, optional: true
end
