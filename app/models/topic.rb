class Topic < ActiveRecord::Base
  has_many :blogs
  validates_presence_of :title
end
