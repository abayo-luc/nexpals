class Post < ApplicationRecord
  # attr_accessor :body, :title, :intro, :tag_list
  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  # is_impressionable
  has_many :comments, dependent: :destroy

  # def should_generate_new_friendly_id?
  #   new_record?
  # end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
    
  end

  def tag_list
    tags.map(&:save).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end 
  end
end
