class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :author_name, :body

  validates_presence_of :author_name
  validates_presence_of :body
end
