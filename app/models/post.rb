class Post < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :title, :body, presence: true
  # attr_accessor :body, :title, :intro, :tag_list
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  # is_impressionable
  has_many :comments, dependent: :destroy

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name).first_or_create!
    end 
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).posts
  end

  def tagged_with
    tags
  end

end
