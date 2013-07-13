class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :articles, through: :taggings

  # overriding to_s method to get an array of tag names instead of tag instances
  def to_s
  	name
  end
  
end
