class Comment < ApplicationRecord
  validates :name, :email, :body, presence: true
  has_many :replies, dependent: :destroy
  belongs_to :post, optional: true
end
